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
        [Parameter(Mandatory)]
        [ComType]$Type,

        # Whether or not the setting is taken from 32-bit or 64-bit mode.
        [Switch]$Is32Bit
    )

    $path = GetOlePath -Is32Bit:$Is32Bit

    $aclObject = [System.Security.AccessControl.CommonSecurityDescriptor]::new(
        $false,
        $false,
        (Get-ItemProperty -Path $path -Name $Type).$Type,
        0
    )
    $aclObject | Add-Member -NotePropertyName Type -NotePropertyValue $Type
    $aclObject | Add-Member -NotePropertyName Is32Bit -NotePropertyValue $Is32Bit.ToBool()

    $aclObject | Add-Member Access -MemberType ScriptProperty -Value {
        foreach ($ace in $this.DiscretionaryAcl) {
            [PSCustomObject]@{
                ComAccessRights   = [ComAccessRights]$ace.AccessMask
                AccessControlType = [System.Security.AccessControl.AccessControlType]$ace.AceType
                IdentityReference = $ace.SecurityIdentifier.Translate([System.Security.Principal.NTAccount])
            } | Add-Member ToString -MemberType ScriptMethod -Force -PassThru -Value {
                '{0} {1} {2}' -f $this.IdentityReference, $this.AccessControlType, $this.ComAccessRights
            }
        }
    }

    $aclObject | Add-Member AccessToString -MemberType ScriptProperty -Value {
        ($this.Access | ForEach-Object { $_.ToString() }) -join "`r`n"
    }

    $aclObject
}
