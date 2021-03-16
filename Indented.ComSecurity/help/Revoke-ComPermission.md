---
external help file: Indented.ComSecurity-help.xml
Module Name: Indented.ComSecurity
online version:
schema: 2.0.0
---

# Revoke-ComPermission

## SYNOPSIS
Revoke a COM right.

## SYNTAX

### FromFields (Default)
```
Revoke-ComPermission -Type <ComType> [-AccessType <AccessControlType>] -Identity <SecurityIdentifier>
 [-Right <ComRight>] [-Is32Bit] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### FromACE
```
Revoke-ComPermission -Type <ComType> [-Ace <CommonAce>] [-Is32Bit] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Revoke a right granted to an identity in a COM ACL.

Entries may be added to the ACL if the revoked rights describe less than the rights assigned to a principal.

## EXAMPLES

### EXAMPLE 1
```
Revoke-ComPermission -Type MachineLaunchRestriction -Right All -Identity $env:USERNAME
```

Revoke all rights which have been explicitly granted to the current user.

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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccessType
The access type which should be removed.
Allow or Deny.

```yaml
Type: AccessControlType
Parameter Sets: FromFields
Aliases:
Accepted values: Allow, Deny

Required: False
Position: Named
Default value: Allow
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Identity
The identity for which rights should be revoked.

```yaml
Type: SecurityIdentifier
Parameter Sets: FromFields
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Right
The rights to revoke.
One or more of Read, LocalLaunch, RemoteLaunch, LocalActivation, RemoteActivation, or All.

```yaml
Type: ComRight
Parameter Sets: FromFields
Aliases:
Accepted values: Read, LocalLaunch, RemoteLaunch, LocalActivation, RemoteActivation, All

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Ace
A CommonAce object from the DiscretionaryACL.

```yaml
Type: CommonAce
Parameter Sets: FromACE
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
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
