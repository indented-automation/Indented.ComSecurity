---
external help file: Indented.ComSecurity-help.xml
Module Name: Indented.ComSecurity
online version:
schema: 2.0.0
---

# Get-ComAcl

## SYNOPSIS
Get security descriptors associated with COM.

## SYNTAX

```
Get-ComAcl [-Type] <ComType> [-Is32Bit] [<CommonParameters>]
```

## DESCRIPTION
Get-ComAcl can be used to read the access control lists which make up COM Security.

## EXAMPLES

### EXAMPLE 1
```
Get-ComAcl -Type MachineLaunchRestriction
```

Get the ACL used to describe launch restrictions.

## PARAMETERS

### -Type
The permission set which should be retrieved.

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

### -Is32Bit
Set to true if the 32-bit registry view should be used to get the ACL.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Security.AccessControl.CommonSecurityDescriptor
## NOTES

## RELATED LINKS
