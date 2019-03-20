# Development root module

$enum = @(
    'ComRight'
    'ComType'
)

foreach ($type in $enum) {
    . ('{0}\enum\{1}.ps1' -f $psscriptroot, $type)
}

$class = @(
    'IdentityTransformationAttribute'
)

foreach ($type in $class) {
    . ('{0}\class\{1}.ps1' -f $psscriptroot, $type)
}

$private = @(
    'GetOlePath'
)

foreach ($command in $private) {
    . ('{0}\private\{1}.ps1' -f $psscriptroot, $command)
}

$public = @(
    'Get-ComAcl'
    'Grant-ComPermission'
    'Revoke-ComPermission'
    'Set-ComAcl'
)

$functionsToExport = foreach ($command in $public) {
    . ('{0}\public\{1}.ps1' -f $psscriptroot, $command)

    $command
}

Export-ModuleMember -Function $functionsToExport