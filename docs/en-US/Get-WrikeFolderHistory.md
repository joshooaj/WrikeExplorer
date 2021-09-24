---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Get-WrikeFolderHistory

## SYNOPSIS
Gets the folder change history for one or more provided folder ID's.

## SYNTAX

```
Get-WrikeFolderHistory [-Id] <String[]> [[-UpdatedAfter] <DateTime>] [[-UpdatedBefore] <DateTime>]
 [[-Include] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Gets the folder change history for one or more provided folder ID's.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-WrikeFolderHistory -Id IAEWYPFMI7LX4Y3J -Include budget, actualCost
```

Gets the history for a specific folder by ID, and includes the historical values for budget and actual cost.

## PARAMETERS

### -Id
Specifies the Wrike folder ID associated with one or more records.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Include
Specifies one or more fields for which to request historical data.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:
Accepted values: actualFees, actualCost, plannedFees, plannedCost, budget

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdatedAfter
Limits results to records that have been updated after the provided date.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdatedBefore
Limits results to records that were last updated before the provided date.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]

## OUTPUTS

### WrikeContactHistory

## NOTES

## RELATED LINKS

[Wrike API Folders & Projects docs](https://developers.wrike.com/api/v4/folders-projects/)
