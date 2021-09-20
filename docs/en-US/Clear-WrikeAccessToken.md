---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Clear-WrikeAccessToken

## SYNOPSIS
Clears the Wrike API App access token from the current session as well as disk

## SYNTAX

```
Clear-WrikeAccessToken [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Clears the Wrike API App access token from the current session as well as disk, if the token
was previously persisted to disk.

## EXAMPLES

### Example 1
```powershell
PS C:\> Clear-WrikeAccessToken
```

Clears the Wrike API App access token from the current user's AppData folder as well as from memory.

## PARAMETERS

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
