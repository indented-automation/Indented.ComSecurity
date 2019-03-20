using namespace System.Security.Principal

function Revoke-ComPermission {
    <#
    .SYNOPSIS
        Revoke a COM right.
    .DESCRIPTION
        Revoke a right granted to an identity in a COM ACL.

        Entries may be added to the ACL if the revoked rights describe less than the rights assigned to a principal.
    .EXAMPLE
        Revoke-ComPermission -Type MachineLaunchRestriction -Right All -Identity $env:USERNAME

        Revoke all rights which have been explicitly granted to the current user.
    #>

    [CmdletBinding(SupportsShouldProcess, DefaultParameterSetName = 'FromFields')]
    param (
        # The ACL to modify. Must be one of DefaultLaunchPermission, MachineAccessRestriction, or MachineLaunchRestriction.
        [Parameter(Mandatory)]
        [ComType]$Type,

        # The access type which should be removed. Allow or Deny.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetname = 'FromFields')]
        [AccessControlType]$AccessType = 'Allow',

        # The identity for which rights should be revoked.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetname = 'FromFields')]
        [IdentityTransformationAttribute()]
        [SecurityIdentifier]$Identity,

        # The rights to revoke. One or more of Read, LocalLaunch, RemoteLaunch, LocalActivation, RemoteActivation, or All.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetname = 'FromFields')]
        [ComRight]$Right,

        # A CommonAce object from the DiscretionaryACL.
        [Parameter(ValueFromPipeline, ParameterSetName = 'FromACE')]
        [CommonAce]$Ace,

        # Set to true if the 32-bit registry view should be used to set the ACL.
        [Switch]$Is32Bit
    )

    begin {
        $aclObject = Get-ComAcl -Type $Type -Is32Bit:$Is32Bit
    }

    process {
        try {
            if ($pscmdlet.ParameterSetName -eq 'FromFields') {
                $aceRemoved = $aclObject.DiscretionaryAcl.RemoveAccess(
                    $AccessType,
                    $Identity,
                    [Int]$Right,
                    'None',
                    'None'
                )
                try {
                    $name = $Identity.Translate([NTAccount])
                } catch {
                    $name = $Identity
                }
            } else {
                try {
                    $name = $ace.IdentityReference.Translate([NTAccount])
                } catch {
                    $name = $ace.IdentityReference
                }
                $aceRemoved = $aclObject.DiscretionaryAcl.RemoveAccess($ace)
            }

            if (-not $aceRemoved) {
                throw 'Failed to remove {0} from {1} ACL' -f $name, $Type
            }
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