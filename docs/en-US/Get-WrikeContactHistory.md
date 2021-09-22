---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Get-WrikeContactHistory

## SYNOPSIS
Gets one or more contact history records from the Wrike API

## SYNTAX

```
Get-WrikeContactHistory [-ContactId] <String[]> [[-UpdatedAfter] <DateTime>] [[-UpdatedBefore] <DateTime>]
 [[-Include] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Gets one or more contact history records from the Wrike API

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-WrikeContact -Me | Get-WrikeContactHistory
```

Gets the contact record representing the user associated with the current permanent access token, and retrieves the contact history records for that Wrike contact.

## PARAMETERS

### -ContactId
Specifies one or more Wrike contact IDs to be returned from the Wrike contacts API. Limit of 100 per invocation.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Id

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Include
Specifies which optional fields to populate on the resulting Contact records.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:
Accepted values: billRate, costRate

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdatedAfter
Specifies the inclusive start of the time range for the contact history request.

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
Specifies the inclusive end of the time range for the contact history request.

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

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
