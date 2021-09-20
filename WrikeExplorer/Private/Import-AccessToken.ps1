function Import-AccessToken {
    [CmdletBinding()]
    param ()

    process {
        $path = Join-Path $script:Config.AppDataPath 'accesstoken.txt'
        if (-not (Test-Path -Path $path)) {
            return
        }
        try {
            $token = Get-Content -Path $path | ConvertTo-SecureString
            $script:Config.Wrike.AccessToken = $token
        }
        catch {
            Write-Error "Failed to import Wrike API App access token from '$path'. Consider deleting the file and using Set-WrikeAccessToken again."
        }
    }
}
