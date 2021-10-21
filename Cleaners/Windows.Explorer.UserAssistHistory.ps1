$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows User Assist History..."

$Key = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count\",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{F4E57C4B-2036-45F0-A9AB-443BCFE33D9F}\Count\"
)
Remove-Item -LiteralPath $Key -Recurse -Force
