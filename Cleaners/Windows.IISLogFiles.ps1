$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows IIS Log Files...'

$path = "$env:SystemRoot\System32\LogFiles\*"
$includes = @(
    "*.log",
    "*.etl"
)
Get-ChildItem -Path $path -Include $includes -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
