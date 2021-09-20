function Request-WrikeDataExport {
    [CmdletBinding()]
    [OutputType([WrikeDataExport])]
    param(
        # Specifies the maximum age of the BI Export data before a refresh request is issued.
        [Parameter()]
        [TimeSpan]
        $MaxAge = ( New-TimeSpan -Hours 12 ),

        # Specifies that if a new BI Export request is issued, the command should block until the request is completed and the results are returned
        [Parameter()]
        [switch]
        $Wait,

        # Specifies the maximum time to wait for a result.
        [Parameter()]
        [TimeSpan]
        $Timeout = [TimeSpan]::MaxValue
    )

    process {
        $minAge = New-TimeSpan -Hours 1
        if ($MaxAge -lt $minAge) {
            Write-Verbose "MaxAge is less than 1 hour. MaxAge will be set to 1 hour."
            $MaxAge = $minAge
        }

        $data = Get-WrikeDataExport
        $now = if ($data.CompletedDate.Kind -eq [System.DateTimeKind]::Utc) { (Get-Date).ToUniversalTime() } else { Get-Date }
        if ($null -ne $data -and $now - $data.CompletedDate -le $MaxAge) {
            # The last report is not older than MaxAge so we just return it
            Write-Output $data
            return
        }

        # Either there is no BI Export data available or it's older than MaxAge
        Write-Verbose "Requesting updated BI Export data"
        $now = Get-Date
        $expireTime = if ($Timeout -eq [TimeSpan]::MaxValue) { [datetime]::MaxValue } else { $now.Add($Timeout) }
        $data = Invoke-WrikeApi -Method Post -Path 'data_export' -ResponseType dataExport

        if (-not $Wait) {
            # Return early with a Status of Scheduled or InProgress probably
            Write-Output $data
            return
        }
        Write-Verbose "Waiting until $expireTime"
        $completedStates = @([WrikeStatus]::Completed, [WrikeStatus]::Cancelled, [WrikeStatus]::Failed)
        $requestInterval = New-TimeSpan -Seconds $script:Config.Wrike.RequestIntervalSeconds
        while ($data.Status -notin $completedStates -and (Get-Date) -lt $expireTime) {
            Write-Verbose "BI Export status is $($data.Status). Checking again in $requestInterval. . ."
            Start-Sleep -Seconds $requestInterval.TotalSeconds
            $data = Request-WrikeDataExport -MaxAge $MaxAge
        }
        Write-Output $data
    }
}
