<#
.SYNOPSIS
Gets only the active file attributes for one or more file system items.

.DESCRIPTION
Returns the current combined AllFileAttributes value for each resolved item.
When exactly one item is returned, only the attribute value is written.
When multiple items are returned, output is formatted as a table.

.PARAMETER Path
Path to one or more file system items. Wildcards are supported.

.EXAMPLE
Get-ActiveFileAttributes -Path C:\temp\demo.txt

Gets the active attribute flags for a single file.

.EXAMPLE
Get-ActiveFileAttributes -Path C:\temp\*.log

Gets active attribute flags for all matching files.

.OUTPUTS
AllFileAttributes
#>
function Get-ActiveFileAttributes {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    $obj = @()
    foreach ($file in Get-Item -Path $Path) {
        $obj += [pscustomobject]@{
            File       = $file.FullName
            Attributes = [AllFileAttributes](Get-ItemProperty -LiteralPath $file.FullName).Attributes
        }
    }

    if ($obj.Count -eq 1) {
        $obj[0].Attributes
    }
    else {
        $obj | Format-Table -Property @{ e = 'File'; Align = 'Left' },
                                      @{ e = 'Attributes'; Align = 'Left' }
    }
}
