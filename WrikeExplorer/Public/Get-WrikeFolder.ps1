function Get-WrikeFolder {
    [CmdletBinding()]
    param (
        # Specifies one or more optional folder ID values for known folders.
        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Id,

        # Specifies the permalink url for the folder
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Permalink,

        # Specifies a metadata filter key
        [Parameter()]
        [ValidateLength(1, 50)]
        [ValidatePattern('[A-Za-z0-9_-]+')]
        [string]
        $Key,

        # Specifies a metadata filter value
        [Parameter()]
        [ValidateLength(0,1000)]
        [string]
        $Value,

        # Specifies an optional custom field filter to limit the search scope. Use New-WrikeFieldFilter to compose a filter.
        [Parameter()]
        [WrikeFieldFilter]
        $FieldFilter,

        # Specifies which type of records to return, projects, folders, or all. Default is 'All'.
        [Parameter()]
        [ValidateSet('Projects', 'Folders', 'All')]
        [string]
        $Type = 'All',

        # Specifies the inclusive last-updated time. Only records last updated after this time will be included in the search scope.
        [Parameter()]
        [datetime]
        $UpdatedAfter,

        # Specifies the inclusive last-updated time. Only records last updated before this time will be included in the search scope.
        [Parameter()]
        [datetime]
        $UpdatedBefore,

        # Specifies that only deleted records should be returned.
        [Parameter()]
        [switch]
        $Deleted,

        # Specifies that descendant folders should not be included in the search scope.
        [Parameter()]
        [switch]
        $NoDescendants,

        # Specifies one or more contract types to include in the search scope.
        [Parameter()]
        [WrikeContractType[]]
        $ContractType,

        # Specifies a set of optional fields to be included in the response model.
        [Parameter()]
        [ValidateSet('metadata', 'hasAttachments', 'attachmentCount', 'description', 'briefDescription', 'customFields', 'customColumnIds', 'superParentIds', 'space', 'contractType', IgnoreCase = $false)]
        [string[]]
        $Include
    )

    process {
        if ($Id.Count -gt 100) {
            Write-Error 'The Wrike API imposes a limit of 100 IDs in a query.'
            return
        }
        if ($null -ne $UpdatedAfter -and $null -ne $UpdatedBefore -and $UpdatedBefore -le $UpdatedAfter) {
            Write-Error 'UpdatedBefore cannot be less than or equal to UpdatedAfter.'
            return
        }

        $query = @{}
        if ($MyInvocation.BoundParameters.ContainsKey('Permalink')) {
            $query.permalink = $Permalink
        }
        if ($MyInvocation.BoundParameters.ContainsKey('NoDescendants')) {
            $query.descendants = (!$NoDescendants).ToString().ToLower()
        }
        if ($MyInvocation.BoundParameters.ContainsKey('Key')) {
            $query.metadata = @{ key = $Key; value = $Value } | ConvertTo-Json -Compress
        }
        if ($MyInvocation.BoundParameters.ContainsKey('FieldFilter')) {
            $query.customField = $FieldFilter.ToString()
        }
        if ($MyInvocation.BoundParameters.ContainsKey('UpdatedAfter') -or $MyInvocation.BoundParameters.ContainsKey('UpdatedBefore')) {
            $query.updatedDate = ConvertTo-TimestampInterval -Start $UpdatedAfter -End $UpdatedBefore -AsJson
        }
        if ($Type -ne 'All') {
            $query.project = ($Type -eq 'Project').ToString().ToLower()
        }
        if ($MyInvocation.BoundParameters.ContainsKey('Deleted')) {
            $query.deleted = $Deleted.ToString().ToLower()
        }
        if ($MyInvocation.BoundParameters.ContainsKey('ContractType')) {
            $selectedTypes = $ContractType | Foreach-Object { $_.ToString() } | Group-Object | Select-Object -ExpandProperty Name
            $json = $selectedTypes | ConvertTo-Json -Compress
            if ($selectedTypes.Count -lt 2) {
                $json = "[$json]"
            }
            $query.contractTypes = $json
        }
        if ($MyInvocation.BoundParameters.ContainsKey('Include')) {
            $Include = $Include | Group-Object | Select-Object -ExpandProperty Name
            $json = $Include | ConvertTo-Json -Compress
            if ($Include.Count -lt 2) {
                $json = "[$json]"
            }
            $query.fields = $json
        }

        $path = 'folders'
        $responseType = 'folderTree'
        if ($null -ne $Id -and $Id.Count -gt 0) {
            $path += '/' + [string]::Join(',', $Id)
            $responseType = 'folders'
        }

        if (($query.Keys | Where-Object { $_ -in @('permalink', 'descendants', 'metadata', 'customField', 'updatedDate', 'project', 'contractTypes') })) {
            $responseType = 'folders'
        }

        Invoke-WrikeApi -Path $path -ResponseType $responseType -Query $query
    }
}
