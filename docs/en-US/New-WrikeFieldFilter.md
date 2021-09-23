---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# New-WrikeFieldFilter

## SYNOPSIS
Creates a new Wrike field filter record

## SYNTAX

```
New-WrikeFieldFilter [-Id] <String> [[-Comparator] <WrikeFieldComparator>] [[-Value] <String[]>]
 [[-MinValue] <String>] [[-MaxValue] <String>] [-Force] [<CommonParameters>]
```

## DESCRIPTION
Creates a new Wrike field filter record which can be used to filter results in functions like Get-WrikeFolder.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-WrikeFolder -FieldFilter (New-WrikeFieldFilter -Id IEAAYPFMJUABBS63 -Comparator Contains -Value 'Joanna')
```

Gets all Wrike folder records where a field is attached with the given ID and a value of 'Joanna' is present within the string.

## PARAMETERS

### -Comparator
Specifies the comparison operator to use against the provided value(s) or minvalue/maxvalue range.

```yaml
Type: WrikeFieldComparator
Parameter Sets: (All)
Aliases:
Accepted values: EqualTo, IsEmpty, IsNotEmpty, LessThan, LessOrEqualTo, GreaterThan, GreaterOrEqualTo, InRange, NotInRange, Contains, StartsWith, EndsWith, ContainsAll, ContainsAny

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Specifies that the filter should be created, even if the ID does not correspond to an existing field or the field type is incompatible with the comparator.

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

### -Id
Specifies the ID of the custom field.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -MaxValue
Specifies the maximum value for range comparison operations.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinValue
Specifies the minimum value for range comparison operations.

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

### -Value
Specifies the value to perform the comparison operator against.

```yaml
Type: String[]
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

### None

## OUTPUTS

### WrikeFieldFilter

## NOTES
Use Get-WrikeCustomField to discover the available custom fields and their ID's.

## RELATED LINKS
