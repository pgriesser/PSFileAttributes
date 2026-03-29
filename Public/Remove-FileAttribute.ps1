<#
.SYNOPSIS
Removes one or more attribute flags from existing file attributes.

.DESCRIPTION
Reads the current attribute value for each item, clears the specified flags using
a bitwise AND NOT operation, and writes the updated value back to the item.

.PARAMETER Path
Path to one or more file system items. Wildcards are supported.

.PARAMETER Attribute
One or more AllFileAttributes values to remove.

.EXAMPLE
Remove-FileAttribute -Path C:\temp\demo.txt -Attribute Hidden

Removes the Hidden flag while preserving other attributes.

.OUTPUTS
None
#>
function Remove-FileAttribute {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory, Position = 0)]
        [string]$Path,
        [Parameter(ValueFromRemainingArguments)]
        [Alias('Attributes')]
        [AllFileAttributes[]]$Attribute
    )

    foreach ($file in Get-Item -Path $Path) {
        $currentAttributes = (Get-ItemProperty -LiteralPath $file.FullName).Attributes
        $newAttributes = $currentAttributes -band -bnot ($Attribute | Measure-Object -Sum).Sum
        Set-ItemProperty -LiteralPath $file.FullName -Name Attributes -Value $newAttributes
    }
}
