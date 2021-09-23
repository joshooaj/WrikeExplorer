function ConvertTo-TimestampInterval {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Nullable[datetime]]
        $Start,

        [Parameter()]
        [Nullable[datetime]]
        $End,

        [Parameter()]
        [switch]
        $AsJson
    )

    process {
        if ($null -ne $Start -and $null -ne $End -and $End -le $Start) {
            Write-Error 'Timestamp for end cannot be less than or equal to timestamp for start.'
            return
        }
        $interval = @{}
        if ($MyInvocation.BoundParameters.ContainsKey('Start') -and $null -ne $Start) {
            $interval.start = $Start.ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
        }
        if ($MyInvocation.BoundParameters.ContainsKey('End') -and $null -ne $End) {
            $interval.end = $End.ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
        }
        if ($AsJson) {
            $interval | ConvertTo-Json -Compress
        }
        else {
            Write-Output $interval
        }
    }
}
