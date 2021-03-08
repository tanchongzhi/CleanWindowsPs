$ErrorActionPreference = 'SilentlyContinue'

Write-Host 'Cleaning Windows Internet Explorer Saved Passwords...'

$keyPath = "HKCU:\Software\Microsoft\Internet Explorer\IntelliForms\Storage2\"
Remove-Item -LiteralPath $keyPath -Recurse -Force
