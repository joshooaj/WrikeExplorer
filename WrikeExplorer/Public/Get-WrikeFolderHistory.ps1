function Get-WrikeFolderHistory {
    [CmdletBinding()]
    [OutputType([WrikeFolderHistory])]
    param (
        # Specifies one or more ID's for known records records.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(1, 100)]
        [string[]]
        $Id,

        # Specifies the inclusive start of the time range for the contact history request
        [Parameter()]
        [datetime]
        $UpdatedAfter,

        # Specifies the inclusive end of the time range for the contact history request
        [Parameter()]
        [datetime]
        $UpdatedBefore,

        # Specifies a set of optional fields to be included in the Wrike Contact response model. Normally these values are empty.
        [Parameter()]
        [ValidateSet('actualFees', 'actualCost', 'plannedFees', 'plannedCost', 'budget', IgnoreCase = $false)]
        [string[]]
        $Include
    )

    process {
        $query = @{}
        if ($MyInvocation.BoundParameters.ContainsKey('Include')) {
            $Include = $Include | Group-Object | Select-Object -ExpandProperty Name
            $json = $Include | ConvertTo-Json -Compress
            if ($Include.Count -lt 2) {
                $json = "[$json]"
            }
            $query.fields = $json
        }
        if ($MyInvocation.BoundParameters.ContainsKey('UpdatedAfter') -or $MyInvocation.BoundParameters.ContainsKey('UpdatedBefore')) {
            $query.updatedDate = ConvertTo-TimestampInterval -Start $UpdatedAfter -End $UpdatedBefore -AsJson
        }

        $path = 'folders'
        if ($null -ne $Id -and $Id.Count -gt 0) {
            $path += '/' + [string]::Join(',', $Id)
        }
        $path += '/folders_history'
        Invoke-WrikeApi -Path $path -ResponseType foldersHistory -Query $query
    }
}
