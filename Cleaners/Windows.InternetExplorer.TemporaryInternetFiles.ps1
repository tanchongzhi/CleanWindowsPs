$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Internet Explorer Temporary Files..."

$Path = @(
    "$env:LOCALAPPDATA\Microsoft\Feeds Cache\*",
    "$env:LOCALAPPDATA\Microsoft\Windows\Temporary Internet Files\*",
    "$env:LOCALAPPDATA\Microsoft\Windows\WebCache\*",
    "$env:LOCALAPPDATA\Microsoft\Windows\INetCache\*",
    "$env:SystemRoot\System32\config\systemprofile\AppData\Local\Microsoft\Windows\INetCache\*",
    "$env:USERPROFILE\AppData\LocalLow\Microsoft\Windows\AppCache\*",
    "$env:LOCALAPPDATA\Microsoft\Windows\AppCache\*"
)
Get-ChildItem -Path $Path -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force

$Path = "$env:LOCALAPPDATA\Microsoft\Windows\WebCache.old"
$null = (Test-Path -Path $Path -PathType Leaf) -and (Remove-Item -Path $Path -Force)
