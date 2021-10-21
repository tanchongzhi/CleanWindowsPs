$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Internet Explorer Saved Passwords..."

$Key = "HKCU:\Software\Microsoft\Internet Explorer\IntelliForms\Storage2\"
Remove-Item -LiteralPath $Key -Recurse -Force
