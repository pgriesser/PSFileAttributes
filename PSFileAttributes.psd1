@{
    RootModule           = 'PSFileAttributes.psm1'
    ModuleVersion        = '1.0.0'
    CompatiblePSEditions = @("Core", "Desktop")
    GUID                 = '8f4ca51a-cf8b-446f-af18-a8f93d7c6c94'
    Author               = 'Philipp Grießer'
    CompanyName          = ''
    Copyright            = ''
    Description          = 'Custom commands for reading and changing file attributes.'
    HelpInfoURI          = 'https://github.com/pgriesser/PSFileAttributes'
    PowerShellVersion    = '5.1'
    FunctionsToExport    = @(
        'Get-AllFileAttributes',
        'Get-ActiveFileAttributes',
        'Get-FileAttributes',
        'Set-FileAttributes',
        'Add-FileAttribute',
        'Remove-FileAttribute'
    )
    CmdletsToExport      = @()
    VariablesToExport    = @()
    AliasesToExport      = @()
    PrivateData          = @{
        PSData = @{
             Tags         = @("FileAttributes")
             ProjectUri   = 'https://github.com/pgriesser/PSFileAttributes'
             ReleaseNotes = @'
1.0.0:
Initial release
'@
        }
    }
}
