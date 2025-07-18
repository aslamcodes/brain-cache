Link different stacks via outpus

```yaml
Outputs:
	SSH:
		Description:
		Value: 
		Export:
			Name: SSHSecurityGroup

```

`Fn::ImportValue SSHSecurityGroup`

Output without exports are just for informational purposes