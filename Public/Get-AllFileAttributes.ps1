<#
.SYNOPSIS
Shows all available file attribute flags and whether each flag is currently set.

.DESCRIPTION
Reads the Attributes value from the target item and compares it against each value
in the AllFileAttributes enum. The command outputs a table with each flag and a
boolean state.

.PARAMETER LiteralPath
Path to the file system item. LiteralPath is used so wildcard characters are not expanded.

.EXAMPLE
Get-AllFileAttributes -LiteralPath C:\temp\demo.txt

Displays all known file attribute flags for the file and marks each as true or false.

.OUTPUTS
System.Object
#>
function Get-AllFileAttributes {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory, Position = 0)]
        [string]$LiteralPath
    )

    $obj = @()
    $flags = (Get-ItemProperty -LiteralPath $LiteralPath -ErrorAction Stop).Attributes
    foreach ($attr in [AllFileAttributes].GetEnumValues()) {
        $i = [pscustomobject]@{ Attribute = $attr; Value = !!($flags -band $attr) }
        if ($i.Value) {
            $i.Value = "$($PSStyle.Foreground.Green) $($i.Value)"
        }
        else {
            $i.Value = "$($PSStyle.Foreground.Red) $($i.Value)"
        }
        $obj += $i
    }

    $obj | Format-Table
}
