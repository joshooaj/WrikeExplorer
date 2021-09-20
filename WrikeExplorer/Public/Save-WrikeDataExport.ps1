function Save-WrikeDataExport {
    [CmdletBinding()]
    param(
        # Specifies the WrikeDataExport data returned from Get-WrikeDataExport or Request-WrikeDataExport. If ommitted, a call will be made to Get-WrikeDataExport automatically.
        [Parameter(ValueFromPipeline)]
        [WrikeDataExport]
        $WrikeDataExport,

        # Specifies the directory where all Wrike BI Export resources will be written as CSV files. Path will be created if it doesn't exist, and existing files will be overwritten.
        [Parameter(Mandatory)]
        [string]
        $Destination
    )

    process {
        $null = New-Item -Path $Destination -ItemType Directory -Force -ErrorAction Stop
        if ($null -eq $WrikeDataExport) {
            $WrikeDataExport = Get-WrikeDataExport
            if ($null -eq $WrikeDataExport) {
                Write-Error "There is no Wrike BI Export data available. Please use Request-WrikeDataExport to refresh the BI Export data."
                return
            }
        }
        foreach ($resource in $WrikeDataExport.Resources) {
            $requestParams = @{
                Uri = $resource.Url
                OutFile = Join-Path $Destination "$($resource.Name).csv"
            }
            $ProgressPreference = 'SilentlyContinue'
            Invoke-WrikeApi @requestParams
        }
    }
}
