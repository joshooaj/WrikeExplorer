---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Get-WrikeFolder

## SYNOPSIS
Gets one or more Wrike folders, or foldertree entries.

## SYNTAX

```
Get-WrikeFolder [[-Id] <String[]>] [[-Permalink] <String>] [[-Key] <String>] [[-Value] <String>]
 [[-FieldFilter] <WrikeFieldFilter>] [[-Type] <String>] [[-UpdatedAfter] <DateTime>]
 [[-UpdatedBefore] <DateTime>] [-Deleted] [-NoDescendants] [[-ContractType] <WrikeContractType[]>]
 [[-Include] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Gets one or more Wrike folders, or foldertree entries. Folders can include hierarchical containers as well as project records.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-WrikeFolder
```

Gets all Wrike folder entries recursively as foldertree objects

### Example 2
```powershell
PS C:\> Get-WrikeFolder -FieldFilter (New-WrikeFieldFilter -Id IEAAYPFMJUABBS63 -Comparator Contains -Value 'Joanna')
```

Gets all Wrike folder records where a field is attached with the given ID and a value of 'Joanna' is present within the string.

## PARAMETERS

### -ContractType
Specifies one or more optional contract types.

```yaml
Type: WrikeContractType[]
Parameter Sets: (All)
Aliases:
Accepted values: Billable, NonBillable

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Deleted
Specifies whether to return exclusively deleted records. To exclusively return "not-deleted" records, specify -Deleted:$false.

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

### -FieldFilter
Specifies a complex custom field filter. Use New-WrikeFieldFilter to generate a valid filter.

```yaml
Type: WrikeFieldFilter
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
Specifies the ID of one or more Wrike folder records.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Include
Specifies one or more optional properties to fill in the Wrike API response.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:
Accepted values: metadata, hasAttachments, attachmentCount, description, briefDescription, customFields, customColumnIds, superParentIds, space, contractType

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Key
Specifies an optional metadata key to filter the search scope.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoDescendants
Excludes descendant folders from search scope.

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

### -Permalink
Specifies the exact permalink matching the folder record to be returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Type
Specifies the type of records to return - projects, folders, or all record types.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Projects, Folders, All

Required: False
Position: 5
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
Position: 6
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
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
Specifies an optional metadata value for a metadata property specified by the Key parameter.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]

## OUTPUTS

### WrikeFolder

## NOTES

## RELATED LINKS
