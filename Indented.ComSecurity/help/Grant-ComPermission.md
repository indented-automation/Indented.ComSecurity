---
external help file: Indented.ComSecurity-help.xml
Module Name: Indented.ComSecurity
online version:
schema: 2.0.0
---

# Grant-ComPermission

## SYNOPSIS
Grant a COM right.

## SYNTAX

```
Grant-ComPermission [-Type] <ComType> [-AccessType <AccessControlType>] [-Identity <SecurityIdentifier>]
 [-Right <ComRight>] [-Is32Bit] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Grant a right to an identity in a COM ACL.

## EXAMPLES

### EXAMPLE 1
```
Grant-ComPermission -Type MachineLaunchRestriction -Right RemoteLaunch -Identity (whoami)
```

Grant the RemoteLaunch right to the current user.

### EXAMPLE 2
```
Grant-ComPermission -Type MachineLaunchRestriction -Right RemoteLaunch, RemoteActivation -Identity EVERYONE
```

Grant the RemoteLaunch and RemoteActivation rights to everyone.

## PARAMETERS

### -Type
The ACL to modify.
Must be one of DefaultLaunchPermission, MachineAccessRestriction, or MachineLaunchRestriction.

```yaml
Type: ComType
Parameter Sets: (All)
Aliases:
Accepted values: DefaultLaunchPermission, MachineAccessRestriction, MachineLaunchRestriction

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccessType
The access type which should be granted.
The value can be Allow or Deny, by default AccessType is set to Allow.

```yaml
Type: AccessControlType
Parameter Sets: (All)
Aliases:
Accepted values: Allow, Deny

Required: False
Position: Named
Default value: Allow
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Identity
The identity which should have rights granted.

```yaml
Type: SecurityIdentifier
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Right
The right to grant.
One or more of Read, LocalLaunch, RemoteLaunch, LocalActivation, RemoteActivation, or All.

```yaml
Type: ComRight
Parameter Sets: (All)
Aliases:
Accepted values: Read, LocalLaunch, RemoteLaunch, LocalActivation, RemoteActivation, All

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Is32Bit
Set to true if the 32-bit registry view should be used to set the ACL.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
