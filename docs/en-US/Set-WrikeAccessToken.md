---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Set-WrikeAccessToken

## SYNOPSIS
Sets the Wrike API App access token to be used with the commands in the WrikeExplorer module.

## SYNTAX

```
Set-WrikeAccessToken [-AccessToken] <Object> [-Ephemeral] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the Wrike API App access token to be used with the commands in the WrikeExplorer module.

To receive a Wrike API App access token, visit https://www.wrike.com/frontend/apps/index.html
and create an API App. Then request a "Permanent access token" for the new app. Copy this
long JSON Web Token (JWT) string and use it with this function to ensure all other commands
in this module use the access token for authentication with the Wrike API.

## EXAMPLES

### Example 1
```powershell
PS C:\> Set-WrikeAccessToken -AccessToken (Read-Host -Prompt 'Access Token' -AsSecureString)
```

Prompts you to enter the 'Access Token', and then persists it to disk as a securestring. You
should only need to do this once per local computer user as it is stored in your AppData folder.

### Example 2
```powershell
PS C:\> Set-WrikeAccessToken -AccessToken (Read-Host -Prompt 'Access Token' -AsSecureString) -Ephemeral(Read-Host -Prompt 'Access Token' -AsSecureString)
```

Prompts you to enter the 'Access Token', and then uses it for the remainder of the PowerShell
session. It will not be persisted to disk.

## PARAMETERS

### -AccessToken
Specifies the API App access token to use for authentication

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

### -Ephemeral
Specifies that the token should not be persisted to disk

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

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

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
