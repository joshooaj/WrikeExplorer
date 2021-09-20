---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Get-WrikeDataExport

## SYNOPSIS
Gets information about an available data export if present

## SYNTAX

```
Get-WrikeDataExport [<CommonParameters>]
```

## DESCRIPTION
The data export API is available to account owners and admins on a Wrike Enterprise plan with the right to "Export account data". If a data export has been requested, then this command returns information about the data export. The information includes all the resource names, and a URL to download that resource (CSV file). Your Wrike API permanent access token is required to access the download URL's so to download the contents of the data export, you can use Save-WrikeDataExport.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-WrikeDataExport
```

Returns the ID of the data export request, the data at which it was completed, the status, and a list of resource names and url's.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### WrikeDataExport

## NOTES

## RELATED LINKS
