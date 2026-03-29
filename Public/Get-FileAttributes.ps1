<#
.SYNOPSIS
Gets file attributes in active-only or full-list mode.

.DESCRIPTION
By default, this command returns currently active attributes using Get-ActiveFileAttributes.
When ShowAll is specified, it calls Get-AllFileAttributes to show every known flag and state.

.PARAMETER Path
Path to one or more file system items.

.PARAMETER ShowAll
When set, displays all possible attribute flags and whether they are enabled.

.EXAMPLE
Get-FileAttributes -Path C:\temp\demo.txt

Returns only the active attributes for the file.

.EXAMPLE
Get-FileAttributes -Path C:\temp\demo.txt -ShowAll

Returns all known attributes and their true/false state.

.OUTPUTS
AllFileAttributes
#>
function Get-FileAttributes {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter()]
        [Alias('All', 'A', 'List', 'L')]
        [switch]$ShowAll
    )

    if ($ShowAll) {
        Get-AllFileAttributes -LiteralPath $Path
    }
    else {
        Get-ActiveFileAttributes -Path $Path
    }
}
