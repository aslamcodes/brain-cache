The locals for cfn, hardcoded

```yaml
Mappings:
	RegionMap:
		us-east-1:
			ami: ami-xx
			ami2: ami-x2
```

Access - `!FindInMap [RegionMap, !Ref "AWS::Region", ami2]`