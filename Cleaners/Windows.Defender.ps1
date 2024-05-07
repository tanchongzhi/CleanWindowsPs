$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Defender History..."

if ([System.Environment]::OSVersion.Version.Major -le 6) {
    $Path = "$env:ProgramData\Microsoft\Windows Defender\Scans\History\*"
    Remove-Item -Path $Path -Recurse -Force

    $Path = "$env:ProgramData\Microsoft\Windows Defender\Support\*"
    $Includes  = @(
        "*.log"
    )
    Get-ChildItem -Path $Path -Include $Includes  -Recurse -Force | Where-Object { -not $_.PSIsContainer } | Remove-Item -Force
} else {
    $FolderPath = 'C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service'
    $FilePath = "$FolderPath\Detections.log"

    if (Test-Path -Path $FilePath) {
        Write-Host "    Restart required."

        $null = schtasks /query /tn ClearWinDefendHistoryOnStartupOnce 2>&1

        if (-not $?) {
            schtasks /create /f /sc onStart /ru 'NT AUTHORITY\SYSTEM' /tn ClearWinDefendHistoryOnStartupOnce /tr "cmd.exe /c rd /s /q \`"$FolderPath\`" & schtasks /delete /f /tn ClearWinDefendHistoryOnStartupOnce"
        }
    }
}
