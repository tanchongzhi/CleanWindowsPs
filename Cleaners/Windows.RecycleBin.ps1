$_RecycleBinNativeMethodSignatures = @"
    [DllImport("Shell32.dll", CharSet = CharSet.Unicode)]
    public static extern uint SHEmptyRecycleBin(IntPtr hwnd, string pszRootPath, uint dwFlags);
"@

if ($PSVersionTable.PSVersion.Major -lt 5) {
    function Clear-RecycleBin {
        param (
            [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
            [string]
            $DriveLetter,

            [Parameter()]
            [switch]
            $Force
        )

        begin {
            if (-not ("RecycleBinNativeMethods.RecycleBinAPI" -as [type])) {
                $addTypeParams = @{
                    MemberDefinition = $_RecycleBinNativeMethodSignatures;
                    Name             = "RecycleBinAPI";
                    Namespace        = "RecycleBinNativeMethods";
                }

                Add-Type @addTypeParams
            }
        }

        process {
            if ($DriveLetter -notmatch '[a-zA-Z]:\\?') {
                return $false
            }
            if ($DriveLetter.EndsWith(":")) {
                $DriveLetter += "\"
            }

            # SHERB_NOCONFIRMATION = 0x00000001, SHERB_NOPROGRESSUI = 0x00000002, SHERB_NOSOUND = 0x00000004
            [uint32]$dwFlags = 7

            $null = [RecycleBinNativeMethods.RecycleBinAPI]::SHEmptyRecycleBin([System.IntPtr]::Zero, $DriveLetter, $dwFlags)
            $lastError = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error()

            $succeedCodes = @(0, 203, 18)

            return $succeedCodes -contains $lastError
        }
    }
}

function Clear-AllDrivesRecycleBin {
    $drives = [System.IO.DriveInfo]::GetDrives()
    $drives = $drives | Where-Object {
        $_.IsReady -and ($_.DriveType -eq [System.IO.DriveType]::Fixed)
    }
    $drives | ForEach-Object {
        $null = Clear-RecycleBin -DriveLetter $_.Name -Force -ErrorAction SilentlyContinue
    }
}

$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows RecycleBin..."

Clear-AllDrivesRecycleBin
