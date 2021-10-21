$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Internet Explorer Autocomplete Form History..."

$Key = @(
    "HKCU:\Software\Microsoft\Internet Explorer\IntelliForms\SPW\",
    "HKCU:\Software\Microsoft\Internet Explorer\IntelliForms\Storage1\",
    "HKCU:\Software\Microsoft\Internet Explorer\IntelliForms\FormData\"
)
Remove-Item -LiteralPath $Key -Recurse -Force
