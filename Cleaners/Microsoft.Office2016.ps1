$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Microsoft Office 2016 MRU lists..."

$Key = @(
    "HKCU:\Software\Microsoft\Office\16.0\Access\File MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Access\Place MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Access\User MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Word\File MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Word\Place MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Word\User MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Excel\File MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Excel\Place MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Excel\User MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Publisher\File MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Publisher\Place MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\Publisher\User MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\PowerPoint\File MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\PowerPoint\Place MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\PowerPoint\User MRU\",
    "HKCU:\Software\Microsoft\Office\16.0\OneNote\RecentNotebooks\"
)
Remove-Item -LiteralPath $Key -Recurse -Force

$Path = @(
    "$env:APPDATA\Microsoft\Office\Recent\*",
    "$env:APPDATA\Microsoft\PowerPoint\Sync\Temp\*",
    "$env:LOCALAPPDATA\Microsoft\MSOIdentityCRL\production\temp\*",
    "$env:LOCALAPPDATA\Microsoft\Office\16.0\WebServiceCache\*",
    "$env:LOCALAPPDATA\Microsoft\Office\16.0\OfficeFileCache\*"
)
Remove-Item -Path $Path -Recurse -Force
