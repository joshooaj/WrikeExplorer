function Save-AccessToken {
    [CmdletBinding()]
    param (
        # Specifies the API App access token to use for authentication
        [Parameter(Mandatory)]
        [securestring]
        $AccessToken,

        # Specifies that the token should not be persisted to disk
        [Parameter()]
        [switch]
        $Ephemeral
    )

    process {
        $script:Config.Wrike.AccessToken = $AccessToken
        if (-not $Ephemeral) {
            $path = Join-Path $script:Config.AppDataPath 'accesstoken.txt'
            $AccessToken | ConvertFrom-SecureString | Set-Content -Path $path
        }
    }
}
