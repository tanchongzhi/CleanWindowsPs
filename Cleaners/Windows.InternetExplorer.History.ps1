$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Internet Explorer History..."

$Path = @(
    "$env:LOCALAPPDATA\Microsoft\Windows\History\*",
    "$env:APPDATA\Microsoft\Windows\IEDownloadHistory\*",
    "$env:LOCALAPPDATA\Microsoft\Internet Explorer\Recovery\*"
)
Remove-Item -Path $Path -Recurse -Force
