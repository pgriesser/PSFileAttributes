. "$PSScriptRoot/AllFileAttributes.ps1"

$publicCommands = Get-ChildItem -Path "$PSScriptRoot/Public/*.ps1" -File
foreach ($commandFile in $publicCommands) {
    . $commandFile.FullName
}

Export-ModuleMember -Function (
    $publicCommands | ForEach-Object { $_.BaseName }
)
