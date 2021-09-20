function Clear-WrikeAccessToken {
    [CmdletBinding(SupportsShouldProcess)]
    param (
    )

    process {
        if ($PSCmdlet.ShouldProcess("Wrike API Access Token", "Clear")) {
            Remove-AccessToken
        }
    }
}
