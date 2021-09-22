function Get-WrikeContact {
    [CmdletBinding()]
    [OutputType([WrikeContact])]
    param (
        # Specifies one or more optional ContactId values for known contacts
        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [Alias('Id')]
        [string[]]
        $ContactId,

        # Specifies that the Wrike Contact record for the current user should be returned
        [Parameter()]
        [Alias('CurrentUser')]
        [switch]
        $Me,

        # Specifies that only deleted Wrike Contact records should be returned
        [Parameter()]
        [switch]
        $Deleted,

        # Specifies a set of optional fields to be included in the Wrike Contact response model. Normally these values are empty.
        [Parameter()]
        [ValidateSet('metadata', 'workScheduleId', 'currentBillRate', 'currentCostRate', IgnoreCase = $false)]
        [string[]]
        $Include
    )

    process {
        if ($ContactId.Count -gt 100) {
            Write-Error 'The Wrike API imposes a limit of 100 contact IDs in a contact history query.'
            return
        }
        $query = @{}
        if ($MyInvocation.BoundParameters.ContainsKey('Me')) {
            $query.me = $Me.ToString().ToLower()
        }
        if ($MyInvocation.BoundParameters.ContainsKey('Deleted')) {
            $query.deleted = $Deleted.ToString().ToLower()
        }
        if ($MyInvocation.BoundParameters.ContainsKey('Include')) {
            # De-duplicate the list of optional fields
            $Include = $Include | Group-Object | Select-Object -ExpandProperty Name
            $json = $Include | ConvertTo-Json -Compress
            if ($Include.Count -lt 2) {
                $json = "[$json]"
            }
            $query.fields = $json
        }
        $path = "contacts"
        if ($null -ne $ContactId -and $ContactId.Count -gt 0) {
            $path += '/' + [string]::Join(',', $ContactId)
        }
        Invoke-WrikeApi -Path $path -ResponseType contacts -Query $query
    }
}
