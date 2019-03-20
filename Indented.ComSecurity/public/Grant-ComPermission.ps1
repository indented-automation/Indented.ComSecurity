using namespace System.Security.Principal

function Grant-ComPermission {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ComType]$Type,

        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateSet('Allow', 'Deny')]
        [String]$AccessType,

        [Parameter(ValueFromPipelineByPropertyName)]
        [IdentityTransformationAttribute()]
        [IdentityReference]$Identity,

        [Parameter(ValueFromPipelineByPropertyName)]
        [ComRight]$Right,

        [Switch]$Is32Bit
    )

    begin {
        $aclObject = Get-ComAcl
    }

    process {
        try {
            if ($Identity -is [NTAccount]) {
                $Identity = $Identity.Translate([SecurityIdentifier])
            }

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
        $aclObject | Set-ComAcl
    }
}