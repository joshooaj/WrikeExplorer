
function Get-WrikeApiVersion {
    [CmdletBinding()]
    param (
    )

    process {
        Invoke-WrikeApi -Path version -ResponseType version
    }
}
