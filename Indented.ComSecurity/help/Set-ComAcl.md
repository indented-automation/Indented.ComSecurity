---
external help file: Indented.ComSecurity-help.xml
Module Name: Indented.ComSecurity
online version:
schema: 2.0.0
---

# Set-ComAcl

## SYNOPSIS
Set a COM Security ACL.

## SYNTAX

```
Set-ComAcl [-Type] <ComType> [-AclObject] <CommonSecurityDescriptor> [-Is32Bit] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Apply an updated ACL to COM Security.

## EXAMPLES

### EXAMPLE 1
```
Set-ComAcl -Type MachineLaunchRestriction -AclObject $aclObject
```

Set a modified ACL for MachineLaunchRestriction.

## PARAMETERS

### -Type
The permission set which should be changed.

```yaml
Type: ComType
Parameter Sets: (All)
Aliases:
Accepted values: DefaultLaunchPermission, MachineAccessRestriction, MachineLaunchRestriction

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AclObject
The ACL object to apply.

```yaml
Type: CommonSecurityDescriptor
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
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
