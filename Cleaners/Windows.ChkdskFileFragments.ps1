$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows chkdsk File Fragments...'

$path = "$env:SystemDrive\File*.chk"
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
