$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Event Logs..."

try {
    Get-EventLog -LogName * | ForEach-Object { Clear-EventLog -LogName $_.Log }
} catch {
    #
}
