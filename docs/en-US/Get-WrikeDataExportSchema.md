---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Get-WrikeDataExportSchema

## SYNOPSIS
Gets the schema for each of the resources provided in a Wrike data export

## SYNTAX

```
Get-WrikeDataExportSchema [<CommonParameters>]
```

## DESCRIPTION
A Wrike data export includes several CSV files. This function returns the resource name, display name, and a list of columns you can expect to find in each CSV including the column name, alias, data type, and foreign key (if present).

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-WrikeDataExportSchema
```

Gets an array of schema definitions, one for each resource type returned in a Wrike data export.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
