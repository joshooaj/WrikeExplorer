function Get-WrikeContact {
    [CmdletBinding()]
    param (
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
        $query = @{}
        if ($MyInvocation.BoundParameters.ContainsKey('Me')) {
            $query.me = $Me.ToString().ToLower()
        }
        if ($MyInvocation.BoundParameters.ContainsKey('Deleted')) {
            $query.deleted = $Deleted.ToString().ToLower()
        }
        if ($MyInvocation.BoundParameters.ContainsKey('Include')) {
            $json = $Include | ConvertTo-Json -Compress
            if ($Include.Count -lt 2) {
                $json = "[$json]"
            }
            $query.fields = $json
        }
        Invoke-WrikeApi -Path contacts -ResponseType contacts -Query $query
    }
}
