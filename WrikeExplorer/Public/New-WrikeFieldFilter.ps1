function New-WrikeFieldFilter {
    [CmdletBinding()]
    [OutputType([WrikeFieldFilter])]
    param (
        # Specifies the custom field ID.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        $Id,

        # Specifies the comparison operator.
        [Parameter()]
        [WrikeFieldComparator]
        $Comparator,

        # Specifies the filter value, or optionally a set of values.
        [Parameter()]
        [string[]]
        $Value,

        # Specifies the minimum value for comparable field types.
        [Parameter()]
        [string]
        $MinValue,

        # Specifies the maximum value for comparable field types.
        [Parameter()]
        [string]
        $MaxValue,

        # Specifies that the filter should be returned even if the ID is not recognized as an existing Wrike custom field ID.
        [Parameter()]
        [switch]
        $Force
    )

    process {
        if (-not $Force) {
            $customField = Get-WrikeCustomField -Id $Id -ErrorAction Stop
            Write-Verbose "Creating field filter for field named '$($customField.Title)'"
            $compatibleComparators = @{
                [WrikeCustomFieldType]::Text = [WrikeFieldComparator]::EqualTo, [WrikeFieldComparator]::IsEmpty, [WrikeFieldComparator]::IsNotEmpty, [WrikeFieldComparator]::LessThan, [WrikeFieldComparator]::LessOrEqualTo, [WrikeFieldComparator]::GreaterThan, [WrikeFieldComparator]::GreaterOrEqualTo, [WrikeFieldComparator]::InRange, [WrikeFieldComparator]::NotInRange, [WrikeFieldComparator]::Contains, [WrikeFieldComparator]::StartsWith, [WrikeFieldComparator]::EndsWith
                [WrikeCustomFieldType]::DropDown = [WrikeFieldComparator]::EqualTo, [WrikeFieldComparator]::IsEmpty, [WrikeFieldComparator]::IsNotEmpty, [WrikeFieldComparator]::LessThan, [WrikeFieldComparator]::LessOrEqualTo, [WrikeFieldComparator]::GreaterThan, [WrikeFieldComparator]::GreaterOrEqualTo, [WrikeFieldComparator]::InRange, [WrikeFieldComparator]::NotInRange, [WrikeFieldComparator]::Contains, [WrikeFieldComparator]::StartsWith, [WrikeFieldComparator]::EndsWith
                [WrikeCustomFieldType]::Numeric = [WrikeFieldComparator]::EqualTo, [WrikeFieldComparator]::IsEmpty, [WrikeFieldComparator]::IsNotEmpty, [WrikeFieldComparator]::LessThan, [WrikeFieldComparator]::LessOrEqualTo, [WrikeFieldComparator]::GreaterThan, [WrikeFieldComparator]::GreaterOrEqualTo, [WrikeFieldComparator]::InRange, [WrikeFieldComparator]::NotInRange
                [WrikeCustomFieldType]::Currency = [WrikeFieldComparator]::EqualTo, [WrikeFieldComparator]::IsEmpty, [WrikeFieldComparator]::IsNotEmpty, [WrikeFieldComparator]::LessThan, [WrikeFieldComparator]::LessOrEqualTo, [WrikeFieldComparator]::GreaterThan, [WrikeFieldComparator]::GreaterOrEqualTo, [WrikeFieldComparator]::InRange, [WrikeFieldComparator]::NotInRange
                [WrikeCustomFieldType]::Percentage = [WrikeFieldComparator]::EqualTo, [WrikeFieldComparator]::IsEmpty, [WrikeFieldComparator]::IsNotEmpty, [WrikeFieldComparator]::LessThan, [WrikeFieldComparator]::LessOrEqualTo, [WrikeFieldComparator]::GreaterThan, [WrikeFieldComparator]::GreaterOrEqualTo, [WrikeFieldComparator]::InRange, [WrikeFieldComparator]::NotInRange
                [WrikeCustomFieldType]::Date = [WrikeFieldComparator]::EqualTo, [WrikeFieldComparator]::IsEmpty, [WrikeFieldComparator]::IsNotEmpty, [WrikeFieldComparator]::LessThan, [WrikeFieldComparator]::LessOrEqualTo, [WrikeFieldComparator]::GreaterThan, [WrikeFieldComparator]::GreaterOrEqualTo, [WrikeFieldComparator]::InRange, [WrikeFieldComparator]::NotInRange
                [WrikeCustomFieldType]::Duration = [WrikeFieldComparator]::EqualTo, [WrikeFieldComparator]::IsEmpty, [WrikeFieldComparator]::IsNotEmpty, [WrikeFieldComparator]::LessThan, [WrikeFieldComparator]::LessOrEqualTo, [WrikeFieldComparator]::GreaterThan, [WrikeFieldComparator]::GreaterOrEqualTo, [WrikeFieldComparator]::InRange, [WrikeFieldComparator]::NotInRange
                [WrikeCustomFieldType]::Checkbox = [WrikeFieldComparator]::EqualTo, [WrikeFieldComparator]::IsEmpty, [WrikeFieldComparator]::IsNotEmpty
                [WrikeCustomFieldType]::Contacts = [WrikeFieldComparator]::EqualTo, [WrikeFieldComparator]::IsEmpty, [WrikeFieldComparator]::IsNotEmpty, [WrikeFieldComparator]::ContainsAll, [WrikeFieldComparator]::ContainsAny
                [WrikeCustomFieldType]::Multiple = [WrikeFieldComparator]::EqualTo, [WrikeFieldComparator]::IsEmpty, [WrikeFieldComparator]::IsNotEmpty, [WrikeFieldComparator]::ContainsAll, [WrikeFieldComparator]::ContainsAny
            }
            if ($Comparator -notin $compatibleComparators.($customField.Type)) {
                Write-Error "The chosen comparator '$Comparator' is not valid for use with the custom field '$($customField.Title)' of type '$($customField.Type)'"
                return
            }
        }
        [WrikeFieldFilter]@{
            Id = $Id
            Comparator = $Comparator
            Value = $Value
            MinValue = $MinValue
            MaxValue = $MaxValue
        }
    }
}
