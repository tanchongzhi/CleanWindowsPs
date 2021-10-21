$_DNSNativeMethodSignatures = @"
    [DllImport("dnsapi.dll")]
    public static extern uint DnsFlushResolverCache();
"@

function Clear-DNSCache {
    begin {
        if (-not ("DNSNativeMethods.DNSAPI" -as [type])) {
            $addTypeParams = @{
                MemberDefinition = $_DNSNativeMethodSignatures;
                Name             = "DNSAPI";
                Namespace        = "DNSNativeMethods";
            }

            Add-Type @addTypeParams
        }
    }

    process {
        $null = [DNSNativeMethods.DNSAPI]::DnsFlushResolverCache()
    }
}

$ErrorActionPreference = "SilentlyContinue"

Write-Host "Cleaning Windows DNS Cache..."

Clear-DNSCache
