$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Temporary Files...'

$path = @(
    "$env:SystemRoot\*.tmp",
    "$env:SystemRoot\*.old"
)
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$path = @(
    "$env:SystemRoot\Temp\*",
    "$env:LOCALAPPDATA\Temp\*"
)
Remove-Item -Path $path -Recurse -Force
