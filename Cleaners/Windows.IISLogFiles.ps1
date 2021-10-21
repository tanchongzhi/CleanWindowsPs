$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows IIS Log Files..."

$Path = "$env:SystemRoot\System32\LogFiles\*"
$Includes  = @(
    "*.log",
    "*.etl"
)
Get-ChildItem -Path $Path -Include $Includes  -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
