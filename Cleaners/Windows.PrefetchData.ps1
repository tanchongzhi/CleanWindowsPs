$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Prefetch Data...'

$path = "$env:SystemRoot\Prefetch\*.pf"
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
