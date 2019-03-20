using namespace System.Security.AccessControl

function Set-ComAcl {
    <#
    .SYNOPSIS
        Set a COM Security ACL.
    .DESCRIPTION
        Apply an updated ACL to COM Security.
    .EXAMPLE
        PS> Set-ComAcl -Type MachineLaunchRestriction -AclObject $aclObject

        Set a modified ACL for MachineLaunchRestriction.
    #>

    [CmdletBinding(SupportsShouldProcess)]
    param (
        # The permission set which should be changed.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ComType]$Type,

        # The ACL object to apply.
        [Parameter(Mandatory, ValueFromPipeline)]
        [CommonSecurityDescriptor]$AclObject,

        # Set to true if the 32-bit registry view should be used to set the ACL.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Switch]$Is32Bit
    )

    begin {
        $path = GetOlePath -Is32Bit:$Is32Bit
    }

    process {
        try {
            $bytes = [Byte[]]::new($AclObject.BinaryLength)
            $AclObject.GetBinaryForm($bytes, 0)

            $existingBytes = Get-ItemPropertyValue -Path $path -Name $Type
            if (Compare-Object $bytes $existingBytes -SyncWindow 0) {
                if ($pscmdlet.ShouldProcess('Setting the {0} ACL' -f $Type)) {
                    Set-ItemProperty -Path $path -Name $Type -Value $bytes
                }
            }
        } catch {
            $pscmdlet.ThrowTerminatingError($_)
        }
    }
}
