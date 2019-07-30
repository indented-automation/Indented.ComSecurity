$enumeration = @(
    'ComRight'
    'ComType'
)

foreach ($file in $enumeration) {
    . ("{0}\enum\{1}.ps1" -f $psscriptroot, $file)
}

$class = @(
    'IdentityTransformationAttribute'
)

foreach ($file in $class) {
    . ("{0}\class\{1}.ps1" -f $psscriptroot, $file)
}

$private = @(
    'GetOlePath'
)

foreach ($file in $private) {
    . ("{0}\private\{1}.ps1" -f $psscriptroot, $file)
}

$public = @(
    'Get-ComAcl'
    'Grant-ComPermission'
    'Revoke-ComPermission'
    'Set-ComAcl'
)

foreach ($file in $public) {
    . ("{0}\public\{1}.ps1" -f $psscriptroot, $file)
}

$functionsToExport = @(
    'Get-ComAcl'
    'Grant-ComPermission'
    'Revoke-ComPermission'
    'Set-ComAcl'
)
Export-ModuleMember -Function $functionsToExport


