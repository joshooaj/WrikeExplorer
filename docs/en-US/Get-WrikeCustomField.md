---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Get-WrikeCustomField

## SYNOPSIS
Gets custom field records from the current Wrike account

## SYNTAX

```
Get-WrikeCustomField [[-Id] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Gets custom field records from the current Wrike account by calling the Wrike customfields endpoint.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-WrikeCustomField
```

Gets all custom fields

## PARAMETERS

### -Id
Specifies the unique ID of an existing custom field record.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### WrikeCustomField

## NOTES

## RELATED LINKS
