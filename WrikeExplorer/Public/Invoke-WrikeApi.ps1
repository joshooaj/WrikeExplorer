function Invoke-WrikeApi {
    [CmdletBinding()]
    param (
        # Specifies the HTTP method to use for the API call
        [Parameter()]
        [ValidateSet('Get', 'Post', 'Delete', 'Put', 'Patch', 'Head', 'Options', 'Merge', 'Trace', 'Default')]
        [string]
        $Method = 'Get',

        # Specifies the full, or base uri to use for the Wrike API call. By default this will be the BaseUri from the module's configuration file.
        [Parameter()]
        [Uri]
        $Uri = [uri]$script:Config.Wrike.BaseUri,

        # Specifies the relative path of the Wrike API to call
        [Parameter()]
        [string]
        $Path = [string]::Empty,

        # Specifies the query string keys and values if applicable
        [Parameter()]
        [hashtable]
        $Query = @{},

        # Specifies any additional headers needed. The Authorization header will be added for you, and if you supply it manually it will be overwritten.
        [Parameter()]
        [hashtable]
        $Headers = @{},

        # Specifies the body for the API call if applicable
        [Parameter()]
        [object]
        $Body,

        # Specifies the path to save files for Wrike API calls that are intended to download data
        [Parameter()]
        [string]
        $OutFile,

        # Specifies the expected response type. This determines the class used to parse the results into a strong type.
        [Parameter()]
        [string]
        $ResponseType
    )

    begin {
        ValidateAccessToken
    }

    process {
        if ($MyInvocation.BoundParameters.ContainsKey('ResponseType') -and -not $script:ResponseType.ContainsKey($ResponseType)) {
            throw "Unexpected ResponseType passed to Invoke-WrikeApi: $ResponseType"
        }

        $Path = $Path.TrimStart('/')
        $uriBuilder = [uribuilder]([uri]::new($Uri, $Path))
        $queryStringCollection = [System.Web.HttpUtility]::ParseQueryString($uriBuilder.Query)
        $Query.Keys | ForEach-Object {
            $queryStringCollection.Add($_, $Query.$_)
        }
        $uriBuilder.Query = $queryStringCollection.ToString()
        $standardHeaders = Get-StandardHeaders
        $standardHeaders.Keys | ForEach-Object { $Headers.$_ = $standardHeaders.$_ }

        $requestParams = @{
            Method = $Method
            Uri = $uriBuilder.Uri
            Headers = $Headers
        }
        foreach ($p in 'Body', 'OutFile') {
            if ($MyInvocation.BoundParameters.ContainsKey($p)) {
                Write-Verbose "Adding parameter '$p' with value '$($MyInvocation.BoundParameters[$p])' to Invoke-RestMethod invocation "
                $requestParams.$p = $MyInvocation.BoundParameters[$p]
            }
        }
        try {
            $response = Invoke-RestMethod @requestParams
            Write-Verbose "Processing API response with kind -eq '$($response.kind)'"
            if ($MyInvocation.BoundParameters.ContainsKey('ResponseType')) {
                if ($response.kind -eq $ResponseType) {
                    $dataType = $script:ResponseType.$ResponseType
                    foreach ($data in $response.data) {
                        $obj = $dataType::new()
                        foreach ($property in $data | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name) {
                            $obj.$property = $data.$property
                        }
                        Write-Output $obj
                    }
                }
                else {
                    Write-Error "Unexpected response from Wrike api: $($response | ConvertTo-Json -Depth 10)"
                }
            }
            elseif ($response) {
                Write-Output $response
            }
        }
        catch [System.Net.Http.HttpRequestException], [System.InvalidOperationException] {
            $errorRecord = $_
            Write-Verbose "Handling $($errorRecord.Exception.GetType()) exception"
            if ($errorDescription = ($errorRecord.ErrorDetails.Message | ConvertFrom-Json -Depth 10) -as [WrikeErrorDescription]) {
                Write-Verbose "Successfully parsed Wrike API error response"
                $errorRecord = $errorDescription | ConvertFrom-WrikeErrorDescription
            }
            Write-Error -ErrorRecord $errorRecord
        }
    }
}
