# PSFileAttributes

Custom PowerShell commands for reading and changing Windows file attributes.
Aside from its practical use, a major contribution is the complete documentation of semantics for all available file attributes, flags and options in [AllFileAttributes.ps1](AllFileAttributes.ps1).

## Features

- View active file attributes for files and folders
- View a full attribute matrix (all known flags with true/false state)
- Replace all attributes on an item
- Add or remove specific attribute flags without overwriting the rest
- Disabled unwanted bitflag arithmetic (i.e. adding ReadOnly twice does not set Hidden)
- Built as an advanced-function module with inline command help

## Exported Commands

- Get-AllFileAttributes
- Get-ActiveFileAttributes
- Get-FileAttributes
- Set-FileAttributes
- Add-FileAttribute
- Remove-FileAttribute

## Installation (from source)

Clone or copy this repository so the module folder is located at one of the paths in `$env:PSModulePath`.

Example target path on Windows:

- `$HOME\Documents\PowerShell\Modules\PSFileAttributes`

Then import the module:

```powershell
Import-Module PSFileAttributes -Force
```

Or import via explicit manifest path:

```powershell
Import-Module "$HOME\Documents\PowerShell\Modules\PSFileAttributes\PSFileAttributes.psd1" -Force
```

## Load Automatically in Your Profile

Add this line to your PowerShell profile:

```powershell
Import-Module "$PSScriptRoot/Modules/PSFileAttributes/PSFileAttributes.psd1" -Force
```

## Usage Examples

Get active attributes:

```powershell
Get-FileAttributes -Path C:\temp\example.txt
```

Show all known flags and their state:

```powershell
Get-FileAttributes -Path C:\temp\example.txt -ShowAll
```

Set attributes exactly to ReadOnly + Hidden:

```powershell
Set-FileAttributes -Path C:\temp\example.txt -Attributes ReadOnly, Hidden
```

Add an attribute:

```powershell
Add-FileAttribute -Path C:\temp\example.txt -Attribute Archive
```

Remove an attribute:

```powershell
Remove-FileAttribute -Path C:\temp\example.txt -Attribute Hidden
```

## Help

Command help:

```powershell
Get-Help Get-FileAttributes -Full
Get-Help Set-FileAttributes -Full
```

Module help topic:

```powershell
Get-Help about_PSFileAttributes -Full
```

## Notes

- `Set-FileAttributes` replaces the full attribute value
- `Add-FileAttribute` and `Remove-FileAttribute` preserve unspecified flags
- All commands except `Get-AllFileAttributes` support wildcards
- Useful aliases are defined for parameters, or they can be completely omitted
- Attribute constants are provided by the `AllFileAttributes` enum in this module
