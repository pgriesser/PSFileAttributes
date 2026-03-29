<#
.SYNOPSIS
Replaces the attribute set for one or more items.

.DESCRIPTION
Builds a new attribute bitmask from the provided AllFileAttributes values and writes
that value to each resolved item. Existing attributes not included in Attributes are removed.

.PARAMETER Path
Path to one or more file system items. Wildcards are supported.

.PARAMETER Attributes
One or more AllFileAttributes values to apply as the complete final attribute set.

.EXAMPLE
Set-FileAttributes -Path C:\temp\demo.txt -Attributes ReadOnly, Hidden

Sets the file attributes to exactly ReadOnly and Hidden.

.OUTPUTS
None
#>
function Set-FileAttributes {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory, Position = 0)]
        [string]$Path,
        [Parameter(ValueFromRemainingArguments)]
        [Alias('Attribute')]
        [AllFileAttributes[]]$Attributes
    )

    foreach ($file in Get-Item -Path $Path) {
        $newAttributes = ($Attributes | Measure-Object -Sum).Sum
        Set-ItemProperty -LiteralPath $file.FullName -Name Attributes -Value $newAttributes
    }
}
