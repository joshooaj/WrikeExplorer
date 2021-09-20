---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Save-WrikeDataExport

## SYNOPSIS
Saves the files associated with the provided Wrike data export

## SYNTAX

```
Save-WrikeDataExport [[-WrikeDataExport] <WrikeDataExport>] [-Destination] <String> [<CommonParameters>]
```

## DESCRIPTION
Saves the result of a Wrike data export to disk. Several CSV files will be created in the Destination path, and the destination path will be created if it doesn't exist.

## EXAMPLES

### Example 1
```powershell
PS C:\> Request-WrikeDataExport -MaxAge (New-TimeSpan -Hours 12) -Wait | Save-WrikeDataExport -Destination C:\Wrike\
```

Checks to see the completed date of the last data export, and if older than 12 hours, requests a new data export. Waits until the data export is complete, in case a new request must be made, and saves the data from the data export to C:\Wrike\ in a series of CSV files.

## PARAMETERS

### -Destination
Specifies the defination path to save the files associated with the Wrike data export. This folder will be created if it doesn't exist.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WrikeDataExport
Specifies the Wrike data export to save. This value of this parameter is returned by Request-WrikeDataExport or Get-WrikeDataExport.

```yaml
Type: WrikeDataExport
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### WrikeDataExport

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
