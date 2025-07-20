---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

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