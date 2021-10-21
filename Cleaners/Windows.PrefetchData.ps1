$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Prefetch Data..."

$Path = "$env:SystemRoot\Prefetch\*.pf"
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
