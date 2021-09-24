function Get-WrikeContactHistory {
    [CmdletBinding()]
    [OutputType([WrikeContactHistory])]
    param (
        # Specifies one or more ID values for known contacts
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateCount(1, 100)]
        [ValidateNotNullOrEmpty()]
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
        [ValidateSet('billRate', 'costRate', IgnoreCase = $false)]
        [string[]]
        $Include
    )

    process {
        if ($null -ne $UpdatedAfter -and $null -ne $UpdatedBefore -and $UpdatedBefore -le $UpdatedAfter) {
            Write-Error 'UpdatedBefore cannot be less than or equal to UpdatedAfter.'
            return
        }

        $query = @{}
        if ($MyInvocation.BoundParameters.ContainsKey('Include')) {
            # De-duplicate the list of optional fields
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

        $path = 'contacts'
        if ($null -ne $Id -and $Id.Count -gt 0) {
            $path += '/' + [string]::Join(',', $Id)
        }
        $path += '/contacts_history'
        Invoke-WrikeApi -Path $path -ResponseType contactsHistory -Query $query
    }
}
