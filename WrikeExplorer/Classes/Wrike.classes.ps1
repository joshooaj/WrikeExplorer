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
