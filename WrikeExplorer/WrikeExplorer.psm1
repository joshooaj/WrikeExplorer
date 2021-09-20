$script:Config = Import-PowerShellDataFile $PSScriptRoot\config.psd1
if ($script:Config.AppDataPath -eq 'Default') {
    $script:Config.AppDataPath = Join-Path -Path ([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::ApplicationData)) -ChildPath 'WrikeExplorer'
}
if (-not (Test-Path $script:Config.AppDataPath)) {
    New-Item -Path $script:Config.AppDataPath -ItemType Directory
}

$script:ResponseType = @{
    contacts = [WrikeContact]
    dataExport = [WrikeDataExport]
    dataExportSchema = [WrikeDataExportSchema]
}

Import-AccessToken
