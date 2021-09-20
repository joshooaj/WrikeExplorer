function Get-WrikeDataExport {
    [CmdletBinding()]
    [OutputType([WrikeDataExport])]
    param()

    process {
        Invoke-WrikeApi -Path 'data_export' -ResponseType dataExport
    }
}
