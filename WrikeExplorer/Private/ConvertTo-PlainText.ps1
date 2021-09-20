function ConvertTo-PlainText {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [securestring]
        $Secret
    )

    process {
        Write-Output ([pscredential]::new('a', $Secret).GetNetworkCredential().Password)
    }
}
