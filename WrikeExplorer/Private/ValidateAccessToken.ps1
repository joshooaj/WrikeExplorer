function ValidateAccessToken {
    [CmdletBinding()]
    param ()

    process {
        if ([string]::IsNullOrWhiteSpace($script:Config.Wrike.AccessToken)) {
            throw "Wrike API App access token has not been set. Please use Set-WrikeAccessToken."
        }
    }
}
