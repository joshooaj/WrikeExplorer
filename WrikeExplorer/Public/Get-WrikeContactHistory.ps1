function Get-WrikeContactHistory {
    [CmdletBinding()]
    [OutputType([WrikeContactHistory])]
    param (
        # Specifies one or more optional ContactId values for known contacts
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [Alias('Id')]
        [string[]]
        $ContactId,

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
        if ($ContactId.Count -gt 100) {
            Write-Error 'The Wrike API imposes a limit of 100 contact IDs in a contact history query.'
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
        if ($null -ne $ContactId -and $ContactId.Count -gt 0) {
            $path += '/' + [string]::Join(',', $ContactId)
        }
        $path += '/contacts_history'
        Invoke-WrikeApi -Path $path -ResponseType contactsHistory -Query $query
    }
}
