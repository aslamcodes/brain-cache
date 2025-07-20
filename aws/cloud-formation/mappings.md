---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

The locals for cfn, hardcoded

```yaml
Mappings:
	RegionMap:
		us-east-1:
			ami: ami-xx
			ami2: ami-x2
```

Access - `!FindInMap [RegionMap, !Ref "AWS::Region", ami2]`