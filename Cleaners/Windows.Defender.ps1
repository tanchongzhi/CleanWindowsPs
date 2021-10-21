$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Defender History..."

$Path = @(
    "$env:ProgramData\Microsoft\Windows Defender\Scans\History\Results\Quick\*",
    "$env:ProgramData\Microsoft\Windows Defender\Scans\History\Results\Resource\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = "$env:ProgramData\Microsoft\Windows Defender\Support\*"
$Includes  = @(
    "*.log"
)
Get-ChildItem -Path $Path -Include $Includes  -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
