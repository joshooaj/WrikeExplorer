---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Request-WrikeDataExport

## SYNOPSIS
Initiates a request for a Wrike data export

## SYNTAX

```
Request-WrikeDataExport [[-MaxAge] <TimeSpan>] [-Wait] [[-Timeout] <TimeSpan>] [<CommonParameters>]
```

## DESCRIPTION
Requests a data export from Wrike. This method initiates a data export which can take several minutes to complete. Once complete, you can get the data export details using Get-WrikeDataExport, and download the data using Save-WrikeDataExport. For automation purposes, you may pipe Request-WrikeDataExport to Save-WrikeDataExport - see the examples.

## EXAMPLES

### Example 1
```powershell
PS C:\> Request-WrikeDataExport -MaxAge (New-TimeSpan -Hours 12) -Wait | Save-WrikeDataExport -Destination C:\Wrike\
```

Checks to see the completed date of the last data export, and if older than 12 hours, requests a new data export. Waits until the data export is complete, in case a new request must be made, and saves the data from the data export to C:\Wrike\ in a series of CSV files.

## PARAMETERS

### -MaxAge
Specifies the maximum age of the last data export before a new data export is requested. Default is 12 hours.

```yaml
Type: TimeSpan
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timeout
Specifies the maximum time to wait for a data export to complete, in case a new data export is requested. Default is to wait indefinitely.

```yaml
Type: TimeSpan
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Wait
Specifies that the function should wait until the data export is completed, in case a new data export is requested.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### WrikeDataExport

## NOTES

## RELATED LINKS
