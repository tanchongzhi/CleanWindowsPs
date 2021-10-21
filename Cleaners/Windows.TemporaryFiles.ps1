$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Temporary Files..."

$Path = @(
    "$env:SystemRoot\*.tmp",
    "$env:SystemRoot\*.old"
)
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Path = @(
    "$env:SystemRoot\Temp\*",
    "$env:LOCALAPPDATA\Temp\*"
)
Remove-Item -Path $Path -Recurse -Force
