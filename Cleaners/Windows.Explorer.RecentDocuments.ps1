$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Explorer Recent Documents...'

$path = "$env:APPDATA\Microsoft\Windows\Recent\*.lnk"
Get-ChildItem -Path $path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\"
Remove-Item -LiteralPath $keyPath -Recurse -Force
