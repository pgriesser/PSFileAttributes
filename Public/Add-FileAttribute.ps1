<#
.SYNOPSIS
Adds one or more attribute flags to existing file attributes.

.DESCRIPTION
Reads the current attribute value for each item, performs a bitwise OR with the
provided attribute flags, and writes the updated value back to the item.

.PARAMETER Path
Path to one or more file system items. Wildcards are supported.

.PARAMETER Attribute
One or more AllFileAttributes values to add.

.EXAMPLE
Add-FileAttribute -Path C:\temp\demo.txt -Attribute Hidden

Adds the Hidden flag while preserving existing attributes.

.OUTPUTS
None
#>
function Add-FileAttribute {
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
        $newAttributes = $currentAttributes -bor ($Attribute | Measure-Object -Sum).Sum
        Set-ItemProperty -LiteralPath $file.FullName -Name Attributes -Value $newAttributes
    }
}
