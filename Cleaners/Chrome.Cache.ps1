$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Chrome Cache..."

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Service Worker\CacheStorage\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Service Worker\Database\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Service Worker\ScriptCache\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Service Worker\CacheStorage\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Service Worker\Database\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Service Worker\ScriptCache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Service Worker\CacheStorage\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Service Worker\Database\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Service Worker\ScriptCache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Service Worker\CacheStorage\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Service Worker\Database\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Service Worker\ScriptCache\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Origin Bound Certs*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Origin Bound Certs*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Origin Bound Certs*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Origin Bound Certs*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extension Rules\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extension State\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Extension Rules\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Extension State\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extension Rules\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extension State\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Extension Rules\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Extension State\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extensions\Temp\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Extensions\Temp\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extensions\Temp\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Extensions\Temp\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\GCM Store\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\GCM Store\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\GCM Store\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\GCM Store\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Pepper Data\Shockwave Flash\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Pepper Data\Shockwave Flash\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Pepper Data\Shockwave Flash\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Pepper Data\Shockwave Flash\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\File System\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\File System\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\File System\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\File System\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Download Service\EntryDB\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Download Service\Files\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Download Service\EntryDB\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Download Service\Files\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Download Service\EntryDB\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Download Service\Files\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Download Service\EntryDB\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Download Service\Files\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Application Cache\Index*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Application Cache\Cache\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Application Cache\Index*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Application Cache\Cache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Application Cache\Index*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Application Cache\Cache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Application Cache\Index*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Application Cache\Cache\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Media Cache\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Cache\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Media Cache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Media Cache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Cache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Media Cache\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\GPUCache\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Storage\ext\*\def\GPUCache\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\GPUCache\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile *\Storage\ext\*\def\GPUCache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\GPUCache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Storage\ext\*\def\GPUCache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\GPUCache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Profile *\Storage\ext\*\def\GPUCache\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\ShaderCache\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\PnaclTranslationCache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\ShaderCache\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\PnaclTranslationCache\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Webstore Downloads\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Webstore Downloads\*"
)
Remove-Item -Path $Path -Recurse -Force

$Path =  @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Crashpad\reports\*",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\*.pma",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\CrashpadMetrics.pma*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Crashpad\reports\*",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\*.pma",
    "$env:LOCALAPPDATA\Microsoft\Edge\User Data\CrashpadMetrics.pma*"
)
Remove-Item -Path $Path -Recurse -Force
