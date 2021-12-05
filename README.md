# Clean Windows

## Prerequisites

* Windows 7 or newer
* PowerShell 2.0 or newer
* Administrator privileges

## Usages

```powershell

.\Invoke-Cleaner.ps1 -ListAvailable

.\Invoke-Cleaner.ps1 -ListSelected

.\Invoke-Cleaner.ps1 -Name Windows.TemporaryFiles
.\Invoke-Cleaner.ps1 -Name Windows.InternetExplorer.*

.\Invoke-Cleaner.ps1 -File Selected.txt

.\Invoke-Cleaner.ps1
```
