# GENERAL
enum WrikeStatus {
    Scheduled
    InProgress
    Completed
    Cancelled
    Failed
}

# BI EXPORT
class WrikeDataExportResource {
    [string]$Name
    [uri]$Url
}

class WrikeDataExport {
    [string]$Id
    [datetime]$CompletedDate
    [WrikeStatus]$Status
    [WrikeDataExportResource[]]$Resources
}

enum WrikeColumnDataType {
    Number
    String
    Date
    Boolean
}

class WrikeDataExportColumn {
    [string] $Id
    [string] $Alias
    [WrikeColumnDataType] $DataType
    [object] $ForeignKey
}

class WrikeDataExportSchema {
    [string] $Id
    [string] $Alias
    [WrikeDataExportColumn[]] $Columns
}

# CONTACTS
enum WrikeUserType {
    Person
    Group
}

class WrikeUserProfile {
    [string] $AccountId
    [string] $Email
    [string] $Role
    [bool] $External
    [bool] $Admin
    [bool] $Owner
}

class WrikeContact {
    [string] $Id
    [string] $FirstName
    [string] $LastName
    [WrikeUserType] $Type
    [WrikeUserProfile[]] $Profiles
    [uri] $AvatarUrl
    [string] $TimeZone
    [string] $Locale
    [bool] $Deleted
    [bool] $Me
    [string[]] $MemberIds
    [object] $Metadata
    [bool] $MyTeam
    [string] $Title
    [string] $CompanyName
    [string] $Phone
    [string] $Location
    [string] $WorkScheduleId
    [object] $CurrentBillRate
    [object] $CurrentCostRate
}

enum WrikeRateSource {
    User
    JobRole
}

class WrikeBudgetRateChangeHistory {
    [WrikeRateSource] $RateSource
    [double] $RateValue
    [datetime] $StartDate
    [datetime] $EndDate
}

class WrikeContactHistory {
    [string] $Id
    [WrikeBudgetRateChangeHistory[]] $BillRateHistory
    [WrikeBudgetRateChangeHistory[]] $CostRateHistory
}

class WrikeErrorDescription {
    [string] $Error
    [string] $ErrorDescription
}


class WrikeApiVersion {
    [int] $Major
    [int] $Minor
}

enum WrikeProjectStatus {
    Green
    Yellow
    Red
    Completed
    OnHold
    Cancelled
    Custom
}

enum WrikeContractType {
    Billable
    NonBillable
}

class WrikeProject {
    [string] $AuthorId
    [string[]] $OwnerIds
    [WrikeProjectStatus] $Status
    [string] $CustomStatusId
    [datetime] $StartDate
    [datetime] $EndDate
    [datetime] $CreatedDate
    [datetime] $CompletedDate
    [WrikeContractType] $ContractType
    [object] $Finance
}

enum WrikeFolderTreeScope {
    WsRoot      # Virtual root folder of account
    RbRoot      # Virtual Recycle Bin folder of account
    WsFolder    # Folder in account
    RbFolder    # Folder is in Recycle Bin (deleted folder)
    WsTask      # Task in account
    RbTask      # Task is in Recycle Bin (deleted task)
}

enum WrikeColor {
    None
    Person
    Purple1
    Purple2
    Purple3
    Purple4
    Indigo1
    Indigo2
    Indigo3
    Indigo4
    DarkBlue1
    DarkBlue2
    DarkBlue3
    DarkBlue4
    Blue1
    Blue2
    Blue3
    Blue4
    Turquoise1
    Turquoise2
    Turquoise3
    Turquoise4
    DarkCyan1
    DarkCyan2
    DarkCyan3
    DarkCyan4
    Green1
    Green2
    Green3
    Green4
    YellowGreen1
    YellowGreen2
    YellowGreen3
    YellowGreen4
    Yellow1
    Yellow2
    Yellow3
    Yellow4
    Orange1
    Orange2
    Orange3
    Orange4
    Red1
    Red2
    Red3
    Red4
    Pink1
    Pink2
    Pink3
    Pink4
    Gray1
    Gray2
    Gray3
}

class WrikeFolderTree {
    [string] $Id
    [string] $Title
    [string] $Color
    [string[]] $ChildIds
    [WrikeFolderTreeScope] $Scope
    [WrikeProject] $Project
    [bool] $Space
}

class WrikeFolder {
    [string] $Id
    [string] $AccountId
    [string] $Title
    [datetime] $CreatedDate
    [datetime] $UpdatedDate
    [string] $BriefDescription
    [string] $Description
    [WrikeColor] $Color
    [string[]] $SharedIds
    [string[]] $ParentIds
    [string[]] $ChildIds
    [string[]] $SuperParentIds
    [WrikeFolderTreeScope] $Scope
    [bool] $HasAttachments
    [int] $AttachmentCount
    [string] $Permalink
    [string] $WorkflowId
    [object[]] $Metadata
    [object[]] $CustomFields
    [string[]] $CustomColumnIds
    [WrikeProject] $Project
}


enum WrikeFieldComparator {
    EqualTo
    IsEmpty
    IsNotEmpty
    LessThan
    LessOrEqualTo
    GreaterThan
    GreaterOrEqualTo
    InRange
    NotInRange
    Contains
    StartsWith
    EndsWith
    ContainsAll
    ContainsAny
}

class WrikeFieldFilter {
    [string] $Id
    [WrikeFieldComparator] $Comparator
    [string[]] $Value
    [string] $MinValue
    [string] $MaxValue

    [string] ToString() {
        $obj = [ordered]@{ id = $this.Id; comparator = $this.Comparator.ToString() }
        if ($null -ne $this.Value -and $this.Value.Count -gt 0) {
            if ($this.Value.Count -eq 1) {
                $obj.value = $this.Value[0]
            }
            else {
                $obj.values = $this.Value
            }
        }
        else {
            if (![string]::IsNullOrWhiteSpace($this.MinValue)) {
                $obj.minValue = $this.MinValue
            }
            if (![string]::IsNullOrWhiteSpace($this.MaxValue)) {
                $obj.maxValue = $this.MaxValue
            }
        }
        return ($obj | ConvertTo-Json -Compress)
    }
}


enum WrikeCurrency {
    USD
    EUR
    GBP
    RUB
    BRL
    AED
    ARS
    BYR
    CAD
    CLP
    COP
    CZK
    DKK
    HKD
    HUF
    INR
    IDR
    ILS
    JPY
    KRW
    MYR
    MXN
    NZD
    NOK
    PEN
    PHP
    PLN
    QAR
    RON
    SAR
    SGD
    ZAR
    SEK
    CHF
    TWD
    THB
    TRY
    UAH
    VND
    CNY
    AUD
    AMD
    BWP
}

enum WrikeAggregationType {
    None
    Sum
    Average
}

enum WrikeCustomFieldType {
    Text
    DropDown
    Numeric
    Currency
    Percentage
    Date
    Duration
    Checkbox
    Contacts
    Multiple
}

class WrikeFieldType {
    static [WrikeCustomFieldType[]] $Comparable = @( [WrikeCustomFieldType]::Text, [WrikeCustomFieldType]::DropDown, [WrikeCustomFieldType]::Numeric, [WrikeCustomFieldType]::Currency, [WrikeCustomFieldType]::Percentage, [WrikeCustomFieldType]::Date, [WrikeCustomFieldType]::Duration )
    static [WrikeCustomFieldType[]] $String = @( [WrikeCustomFieldType]::Text, [WrikeCustomFieldType]::DropDown )
    static [WrikeCustomFieldType[]] $Collection = @( [WrikeCustomFieldType]::Contacts, [WrikeCustomFieldType]::Multiple )
    static [WrikeCustomFieldType[]] $Boolean = @( [WrikeCustomFieldType]::Checkbox )
}

class WrikeCustomFieldSettings {
    [string] $InheritanceType
    [int] $DecimalPlaces
    [bool] $UseThousandsSeparator
    [WrikeCurrency] $Currency
    [WrikeAggregationType] $Aggregation
    [string[]] $Values
    [bool] $AllowOtherValues
    [string[]] $Contacts
    [bool] $ReadOnly
    [bool] $AllowTime
}

class WrikeCustomField {
    [string] $Id
    [string] $AccountId
    [string] $Title
    [WrikeCustomFieldType] $Type
    [string] $SpaceId
    [string[]] $SharedIds
    [WrikeCustomFieldSettings] $Settings
}

class WrikeProjectHistory {
    [object[]] $ActualFees
    [object[]] $ActualCost
    [object[]] $PlannedFees
    [object[]] $PlannedCost
    [object[]] $Budget
}

class WrikeFolderHistory {
    [string] $Id
    [WrikeProjectHistory] $Project
}
