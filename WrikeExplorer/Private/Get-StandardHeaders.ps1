function Get-StandardHeaders {
    [CmdletBinding()]
    param ()

    process {
        $headers = @{
            Authorization = "Bearer $($script:Config.Wrike.AccessToken | ConvertTo-PlainText)"
        }
        Write-Output $headers
    }
}
