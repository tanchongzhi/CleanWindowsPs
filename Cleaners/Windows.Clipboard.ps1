$_User32NativeMethodSignatures = @"
    [DllImport("User32.dll")]
    public static extern byte OpenClipboard(IntPtr hWndNewOwner);

    [DllImport("User32.dll")]
    public static extern byte CloseClipboard();

    [DllImport("User32.dll")]
    public static extern byte EmptyClipboard();
"@

function Clear-Clipboard {
    begin {
        if (-not ("User32NativeMethods.ClipboardAPI" -as [type])) {
            $addTypeParams = @{
                MemberDefinition = $_User32NativeMethodSignatures;
                Name             = "ClipboardAPI";
                Namespace        = "User32NativeMethods";
            }

            Add-Type @addTypeParams
        }
    }

    process {
        try {
            $r = [User32NativeMethods.ClipboardAPI]::OpenClipboard([System.IntPtr]::Zero)

            if ($r -eq 0) {
                return
            }

            $r = [User32NativeMethods.ClipboardAPI]::EmptyClipboard()
            $null = [User32NativeMethods.ClipboardAPI]::CloseClipboard()
        } catch {
            #
        }
    }
}

$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows Clipboard..."

Clear-Clipboard
