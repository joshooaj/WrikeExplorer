---
external help file: WrikeExplorer-help.xml
Module Name: WrikeExplorer
online version:
schema: 2.0.0
---

# Invoke-WrikeApi

## SYNOPSIS
Calls the Wrike REST API with the required bearer token for authentication

## SYNTAX

```
Invoke-WrikeApi [[-Method] <String>] [[-Uri] <Uri>] [[-Path] <String>] [[-Query] <Hashtable>]
 [[-Headers] <Hashtable>] [[-Body] <Object>] [[-OutFile] <String>] [[-ResponseType] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
This function is not intended for public use except where required. For example, it is used for module testing purposes, and to perform API calls for features that are not yet supported with a dedicated function. All dedicated Wrike API functions should use this function to perform REST API calls as it provides a central place to maintain logic for composing headers, parsing results and handling errors.

## EXAMPLES

### Example 1
```powershell
PS C:\> Invoke-WrikeApi -Path 'contacts' -ResponseType 'contacts'
```

Performs a GET request against the contacts api and returns all contacts on the Wrike account.

## PARAMETERS

### -Body
Specifies the HTTP content/body for the REST API call. This is passed directly to the Body parameter of Invoke-RestMethod.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Headers
Specifies any additional headers to send with Invoke-RestMethod. The Authorization header is already provided by this function, so a user-supplied Authorization header will be ignored.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Method
Specifies the HTTP verb to use with Invoke-RestMethod.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Get, Post, Delete, Put, Patch, Head, Options, Merge, Trace, Default

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutFile
Specifies the output path for HTTP requests for downloadable files.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Specifies the "Path" portion of the URI. If the default URI is used, then the path will be appended to the existing base URI.

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

### -Query
Specifies a collection of string key/value pairs to include in the query string with the HTTP request.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResponseType
Specifies the expected response type. The supported response type strings are mapped to PowerShell classes within the module definition.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Uri
Specifies the base URI for the Invoke-RestMethod to use. The default value is 'https://www.wrike.com/api/v4/'

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
