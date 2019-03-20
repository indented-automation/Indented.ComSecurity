using namespace System.Management.Automation
using namespace System.Security.Principal

class IdentityTransformationAttribute : ArgumentTransformationAttribute {
    [Object] Transform(
        [EngineIntrinsics] $engineIntrinsics,
        [Object]           $inputData
    ) {
        if ($inputData -is [NTAccount] -or $inputData -is [SecurityIdentifier]) {
            return $inputData
        } elseif ($inputData -is [String]) {
            if ($inputData.StartsWith('S-1-5-')) {
                return [SecurityIdentifier]$inputData
            } else {
                return [NTAccount]$inputData
            }
        }
        throw '{0} is not a valid identity' -f $inputData
    }
}
