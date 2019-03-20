using namespace System.Security.Principal

function Grant-ComPermission {
    <#
    .SYNOPSIS
        Grant a COM right.
    .DESCRIPTION
        Grant a right to an identity in a COM ACL.
    .EXAMPLE
        Grant-ComPermission -Type MachineLaunchRestriction -Right RemoteLaunch -Identity (whoami)

        Grant the RemoteLaunch right to the current user.
    .EXAMPLE
        Grant-ComPermission -Type MachineLaunchRestriction -Right RemoteLaunch, RemoteActivation -Identity EVERYONE

        Grant the RemoteLaunch and RemoteActivation rights to everyone.
    #>

    [CmdletBinding(SupportsShouldProcess)]
    param (
        # The ACL to modify. Must be one of DefaultLaunchPermission, MachineAccessRestriction, or MachineLaunchRestriction.
        [Parameter(Mandatory, Position = 1)]
        [ComType]$Type,

        # The access type which should be granted. The value can be Allow or Deny, by default AccessType is set to Allow.
        [Parameter(ValueFromPipelineByPropertyName)]
        [AccessControlType]$AccessType = 'Allow',

        # The identity which should have rights granted.
        [Parameter(ValueFromPipelineByPropertyName)]
        [IdentityTransformationAttribute()]
        [SecurityIdentifier]$Identity,

        # The right to grant. One or more of Read, LocalLaunch, RemoteLaunch, LocalActivation, RemoteActivation, or All.
        [Parameter(ValueFromPipelineByPropertyName)]
        [ComRight]$Right,

        # Set to true if the 32-bit registry view should be used to set the ACL.
        [Switch]$Is32Bit
    )

    begin {
        $aclObject = Get-ComAcl -Type $Type -Is32Bit:$Is32Bit
    }

    process {
        try {
            $aclObject.DiscretionaryAcl.AddAccess(
                $AccessType,
                $Identity,
                [Int]$Right,
                'None',
                'None'
            )
        } catch {
            Write-Error -ErrorRecord $_
        }
    }

    end {
        if ($pscmdlet.ShouldProcess('Applying changes to discretionary ACL for {0}' -f $Type)) {
            $aclObject | Set-ComAcl
        }
    }
}