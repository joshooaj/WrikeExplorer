Describe "Wrike API Success Tests" {
    BeforeAll -Scriptblock {
        $skip = $null -eq $env:ACCESS_TOKEN
        if (-not $skip) {
            Set-WrikeAccessToken -AccessToken $env:ACCESS_TOKEN -Ephemeral -WarningAction SilentlyContinue
        }
    }

    It 'Get-WrikeContact returns self' -Skip:$skip {
        $me = Get-WrikeContact -Me
        $me.Id | Should -Not -BeNullOrEmpty
    }
}

Describe "Wrike API Error Tests" {
    # Do not assume the access token is properly set for any given test.
    # Each test should set the access token itself.
    It 'Responds to invalid tokens correctly' {
        Set-WrikeAccessToken -AccessToken 'Pester-Tests' -Ephemeral -WarningAction SilentlyContinue
        { Get-WrikeDataExport } | Should -Throw -ErrorId 'not_authorized,Invoke-WrikeApi'
    }
}
