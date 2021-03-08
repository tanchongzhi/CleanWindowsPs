$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Defender History...'

$path = @(
    "$env:ProgramData\Microsoft\Windows Defender\Scans\History\Results\Quick\*",
    "$env:ProgramData\Microsoft\Windows Defender\Scans\History\Results\Resource\*"
)
Remove-Item -Path $path -Recurse -Force

$path = "$env:ProgramData\Microsoft\Windows Defender\Support\*"
$includes = @(
    "*.log"
)
Get-ChildItem -Path $path -Include $includes -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
