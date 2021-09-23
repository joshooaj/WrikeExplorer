---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Get-WrikeApiVersion

## SYNOPSIS
Gets the Wrike API version by querying the Wrike API "version" endpoint

## SYNTAX

```
Get-WrikeApiVersion [<CommonParameters>]
```

## DESCRIPTION
Gets the Wrike API version by querying the Wrike API "version" endpoint

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-WrikeApiVersion
```

Queries the Wrike API for the API version.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES
At the time of this writing, this API method returns "1.0" despite using the v4 for the base URI of all API calls.

## RELATED LINKS

[Wrike API Version docs](https://developers.wrike.com/api/v4/version/)
