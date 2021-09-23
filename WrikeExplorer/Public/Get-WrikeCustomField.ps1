function Get-WrikeCustomField {
    [CmdletBinding()]
    [OutputType([WrikeCustomField])]
    param (
        # Specifies one or more optional id's to limit the results.
        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateCount(0, 100)]
        [string[]]
        $Id
    )

    process {
        $path = 'customfields'
        if ($null -ne $Id -and $Id.Count -gt 0) {
            $path += '/' + [string]::Join(',', $Id)
        }
        Invoke-WrikeApi -Path $path -ResponseType 'customfields'
    }
}
