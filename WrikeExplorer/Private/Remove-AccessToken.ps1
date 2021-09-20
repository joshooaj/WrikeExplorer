function Remove-AccessToken {
    [CmdletBinding()]
    param (
    )

    process {
        $script:Config.Wrike.AccessToken = $null
        $path = Join-Path $script:Config.AppDataPath 'accesstoken.txt'
        Remove-Item -Path $path -Force
    }
}
