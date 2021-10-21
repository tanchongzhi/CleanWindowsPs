$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows chkdsk File Fragments..."

$Path = "$env:SystemDrive\File*.chk"
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
