function ConvertFrom-WrikeErrorDescription {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [WrikeErrorDescription]
        $WrikeErrorDescription
    )

    process {
        $categoryMap = @{
            invalid_request = 'ProtocolError'
            invalid_parameter = 'InvalidArgument'
            parameter_required = 'InvalidData'
            not_authorized = 'SecurityError'
            access_forbidden = 'PermissionDenied'
            not_allowed = 'PermissionDenied'
            resource_not_found = 'ObjectNotFound'
            method_not_found = 'InvalidOperation'
            too_many_requests = 'LimitsExceeded'
            rate_limit_exceeded = 'LimitsExceeded'
            server_error = 'NotSpecified'
        }
        $e = [exception]::new($WrikeErrorDescription.ErrorDescription)
        $category = [System.Management.Automation.ErrorCategory]::($categoryMap.($WrikeErrorDescription.Error))
        $record = [System.Management.Automation.ErrorRecord]::new($e, $WrikeErrorDescription.Error, $category, $null)
        Write-Output $record
    }
}
