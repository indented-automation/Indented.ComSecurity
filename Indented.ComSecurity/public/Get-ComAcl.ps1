using namespace System.Security.AccessControl
using namespace System.Security.Principal

function Get-ComAcl {
    <#
    .SYNOPSIS
        Get security descriptors associated with COM.
    .DESCRIPTION
        Get-ComAcl can be used to read the access control lists which make up COM Security.
    .EXAMPLE
        Get-ComAcl -Type MachineLaunchRestriction

        Get the ACL used to describe launch restrictions.
    #>

    [CmdletBinding()]
    [OutputType([System.Security.AccessControl.CommonSecurityDescriptor])]
    param (
        # The permission set which should be retrieved.
        [Parameter(Mandatory, Position = 1)]
        [ComType]$Type,

        # Set to true if the 32-bit registry view should be used to get the ACL.
        [Switch]$Is32Bit
    )

    $path = GetOlePath -Is32Bit:$Is32Bit

    $aclObject = [CommonSecurityDescriptor]::new(
        $false,
        $false,
        (Get-ItemPropertyValue -Path $path -Name $Type),
        0
    )

    $aclObject | Add-Member -NotePropertyName Type -NotePropertyValue $Type
    $aclObject | Add-Member -NotePropertyName Is32Bit -NotePropertyValue $Is32Bit.ToBool()

    $aclObject | Add-Member Access -MemberType ScriptProperty -Value {
        foreach ($ace in $this.DiscretionaryAcl) {
            [PSCustomObject]@{
                ComAccessRights   = [ComRight]$ace.AccessMask
                AccessControlType = [AccessControlType]$ace.AceType
                IdentityReference = $ace.SecurityIdentifier.Translate([NTAccount])
            } | Add-Member ToString -MemberType ScriptMethod -Force -PassThru -Value {
                '{0} {1} {2}' -f @(
                    $this.IdentityReference.ToString().PadRight(32),
                    $this.AccessControlType.ToString().PadRight(10),
                    $this.ComAccessRights
                )
            }
        }
    }

    $aclObject | Add-Member AccessToString -MemberType ScriptProperty -Value {
        ($this.Access | ForEach-Object { $_.ToString() }) -join [Environment]::NewLine
    }

    $aclObject
}
