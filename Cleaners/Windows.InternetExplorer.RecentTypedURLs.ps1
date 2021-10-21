$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Internet Explorer Recent Typed URLs..."

$Key = @(
    "HKCU:\Software\Microsoft\Internet Explorer\TypedURLs\",
    "HKCU:\Software\Microsoft\Internet Explorer\TypedURLsTime\",
    "HKCU:\Software\Microsoft\Internet Explorer\Explorer Bars\{C4EE31F3-4768-11D2-BE5C-00A0C9A83DA1}\FilesNamedMRU\",
    "HKCU:\Software\Microsoft\Internet Explorer\Explorer Bars\{C4EE31F3-4768-11D2-BE5C-00A0C9A83DA1}\ContainingTextMRU\"
)
Remove-Item -LiteralPath $Key -Recurse -Force
