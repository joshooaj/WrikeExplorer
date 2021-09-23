# WrikeExplorer

<img src="https://github.com/jhendricks123/WrikeExplorer/raw/main/Logo.png" height="100">A PowerShell module for interacting with the [Wrike REST API](https://developers.wrike.com/).

## Overview

The [Wrike REST API](https://developers.wrike.com/) provides access to most, if not all of the elements of your account. The primary motivation for creating this module was to automate the download of Wrike data using the [data export methods](https://developers.wrike.com/api/v4/data-export/). The CSV files from the data exports are pulled into Power BI using [Power BI gateway](https://powerbi.microsoft.com/en-us/gateway/). As time permits, I hope additional features will be added to this module until the entire set of API features are supported.

## Getting Started

Before you can use the WrikeExplorer module, you need to obtain a permanent access token from the [Apps & Integrations](https://www.wrike.com/frontend/apps/index.html#/apps/) dashboard of your Wrike account by creating a new API app:

1. Visit [Apps & Integrations](https://www.wrike.com/frontend/apps/index.html#/apps/)
2. Click **API** on the side bar
3. Under API Apps, enter a name for your app (*I called mine 'BI Export Tool'*), then click **Create new**
4. Under Permanent access token click **Create token**
5. Copy the token and keep it safe. If you leak this token, a malicious attacker could absolutely ruin your day.

*Note: You may safely ignore the Redirect URI and HTTP access control (CORS) settings since WrikeExplorer is not a cloud or web-based service.*

Once you have your permanent access token, you can install WrikeExplorer and save your token securely:

```powershell
Install-Module WrikeExplorer
$token = Read-Host -Prompt 'Wrike API Access Token' -AsSecureString
Set-WrikeAccessToken -AccessToken $token

# Now let's test to make sure you can successfully query information from your Wrike account
Get-WrikeContact -Me
```

### Wrike API Coverage

Following are all the models established in Wrike API v4, referred to as "methods" in the [developer documentation](https://developers.wrike.com/), and the estimated coverage of those methods in this module.

| Model                     | Coverage |
|---------------------------|----------|
| Contacts                  | 66%      |
| Users                     | 0%       |
| Groups                    | 0%       |
| Invitations               | 0%       |
| Account                   | 0%       |
| Workflows                 | 0%       |
| Custom Fields             | 0%       |
| Folders & Projects        | 0%       |
| Tasks                     | 0%       |
| Comments                  | 0%       |
| Dependencies              | 0%       |
| Timelogs                  | 0%       |
| Timelog categories        | 0%       |
| Attachments               | 0%       |
| Version                   | 0%       |
| IDs                       | 0%       |
| Colors                    | 0%       |
| Spaces                    | 0%       |
| Data Export               | 100%     |
| Audit Log                 | 0%       |
| Access Roles              | 0%       |
| Async job                 | 0%       |
| Approvals                 | 0%       |
| Work Schedules            | 0%       |
| Work Scehdule exceptions  | 0%       |
| User Scheduled exceptions | 0%       |
| Blueprints                | 0%       |
| EDiscovery                | 0%       |
| Hourly rates              | 0%       |
| Special syntax            | 0%       |
| Errors                    | 100%     |

## Can I make API calls for models not handled by the module?

Sure, the `Invoke-WrikeApi` can be called directly with a known URI and/or path! For example, you can see [here](https://developers.wrike.com/api/v4/timelogs/) that Wrike has a "timelogs" endpoint on their API. To use it, you can call `Invoke-WrikeApi` like this:

```powershell
PS C:\> Invoke-WrikeApi -Path timelogs
```

You should get a `[pscustomobject]` returned by the underlying Invoke-RestMethod cmdlet with a `kind` property indicating the response type (in this case it woudl be "timelogs"), and a `data` array for you to process yourself. The advantage of using `Invoke-WrikeApi` over using Invoke-RestMethod is that the authentication header is provided automatically, and any potential API errors are parsed for you. Plus, if you need to provide URL query parameters, you can provide them as a hashtable and they will be made URL-safe for you.

## How do I \<blank\>

All functions in WrikeExplorer should be documented and include examples. If you discover otherwise, please raise an issue. To see the documentation and examples for each command, use Get-Help as shown below:

```powershell
Get-Help Get-WrikeContact -Full

Get-Help Save-WrikeDataExport -Full
```

## Where is my permanent access token stored

When you use `Set-WrikeAccessToken` without the "-Ephemeral" option, your token is encrypted using "current user scope" and saved to disk in %APPDATA%/WrikeExplorer. The full file path on Windows is typically ~\AppData\Roaming\WrikeExplorer while on linux it's ~/.config/WrikeExplorer.

The token is handled as a "securestring" object and is not stored in plain text. However, any application running under your local computer user profile could decrypt your token so it is advised not to setup the module on a server or PC that is not your daily driver.

If you prefer to keep your token in a key store of some kind, that's a great idea! You can avoid persisting the token to disk by using the "-Ephemeral" switch as shown below. When you do this, the token is kept in memory as a securestring for the duration of the session, and is never persisted to disk.

```powershell
# Retrieve your token from whatever secure key vault product you're using
$token = Get-TokenFromYourKeyValut

# Set the token for the current session without persisting it to disk
Set-WrikeAccessToken -AccessToken $token -Ephemeral
```
