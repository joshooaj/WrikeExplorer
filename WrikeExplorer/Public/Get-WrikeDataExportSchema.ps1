function Get-WrikeDataExportSchema {
    [CmdletBinding()]
    param ()

    process {
        Invoke-WrikeApi -Path 'data_export_schema' -ResponseType dataExportSchema
    }
}
