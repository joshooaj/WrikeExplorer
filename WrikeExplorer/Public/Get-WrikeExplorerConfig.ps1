function Get-WrikeExplorerConfig {
    [CmdletBinding()]
    param (

    )

    process {
        Write-Output $script:Config
    }
}
