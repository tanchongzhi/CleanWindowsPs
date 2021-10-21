$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Explorer Recent Documents..."

$Path = "$env:APPDATA\Microsoft\Windows\Recent\*.lnk"
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\"
Remove-Item -LiteralPath $Key -Recurse -Force
