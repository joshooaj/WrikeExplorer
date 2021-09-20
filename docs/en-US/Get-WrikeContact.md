---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Get-WrikeContact

## SYNOPSIS
Get one or more contact records from the Wrike API

## SYNTAX

```
Get-WrikeContact [-Me] [-Deleted] [[-Include] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Get one or more contact records from the Wrike API

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-WrikeContact -Deleted:$false
```

Get all contact records from Wrike where the record is not marked as deleted

### Example 2
```powershell
PS C:\> Get-WrikeContact -Deleted
```

Get all contact records from Wrike where the record is marked as deleted

### Example 3
```powershell
PS C:\> Get-WrikeContact -Include metadata
```

Get all contact records from Wrike, and include any available metadata.

### Example 4
```powershell
PS C:\> Get-WrikeContact -Me
```

Get the Wrike contact record representing the current Wrike user.

## PARAMETERS

### -Deleted
Specifies whether to limit the results either to deleted, or not-deleted users.

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

### -Include
Specifies which additional optional fields to populate on the resulting Contact records.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:
Accepted values: metadata, workScheduleId, currentBillRate, currentCostRate

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Me
Specifies that only one contact record should be returned. The one representing the current user.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: CurrentUser

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

### System.Object
## NOTES

## RELATED LINKS
