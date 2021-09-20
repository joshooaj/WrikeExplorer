function Set-WrikeAccessToken {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Specifies the API App access token to use for authentication. It is recommended to provide a securestring, but a string can also be provided.
        [Parameter(Mandatory)]
        [object]
        $AccessToken,

        # Specifies that the token should not be persisted to disk
        [Parameter()]
        [switch]
        $Ephemeral
    )

    process {
        $valueType = $AccessToken.GetType().Name
        if ($valueType -eq 'String') {
            Write-Warning "The AccessToken value was received as a string. For better security it is recommended to use a securestring instead. Otherwise it's possible your PowerShell command history could be read, and secrets like these could be stolen. Try using 'Read-Host -AsSecureString' to collect tokens, passwords, and secrets in the future."
            Write-Verbose 'Converting the AccessToken string to a securestring'
            $AccessToken = $AccessToken | ConvertTo-SecureString -AsPlainText -Force
        }
        elseif ($valueType -ne 'SecureString') {
            Write-Error "AccessToken is expected to be of type SecureString or String. Received a $valueType instead."
        }

        if ($PSCmdlet.ShouldProcess("Wrike API Access Token", "Set")) {
            Write-Verbose "Setting the Wrike API access token. Ephemeral = $Ephemeral"
            Save-AccessToken -AccessToken $AccessToken -Ephemeral:$Ephemeral
        }
    }
}
