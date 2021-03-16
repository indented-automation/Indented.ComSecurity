function GetOlePath {
    <#
    .SYNOPSIS
        Get the path to OLE.
    .DESCRIPTION
        Get the path to OLE depending on the current process and the requested registry view.
    #>

    [CmdletBinding()]
    param (
        # Set to true if the 32-bit registry view should be used to get the ACL.
        [Switch]$Is32Bit
    )

    if (($Is32Bit -and [IntPtr]::Size -eq 8) -or (-not $Is32Bit -and [IntPtr]::Size -eq 4)) {
        return 'HKLM:\Software\Wow6432Node\Microsoft\Ole'
    }
    return 'HKLM:\Software\Microsoft\Ole'
}