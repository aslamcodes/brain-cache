---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

## change sets
tf plan -> create changesets
tf apply - > direct update or use change sets and apply them

## **Rollback behavior**
In case of provisioning failure you can either
- choose to keep successfully created resources
- rollback all of the resources
	- you can use deletion policy or
	- you can simply delete all of the resources

![[clouformation-1752861843974.png]]


## **Deletion policy**
```
Resources:
  MyVolume:
    Type: AWS::EC2::Volume
    DeletionPolicy: Retain
    Properties:
      Size: 10
      AvailabilityZone: us-east-1a

```
### Supported Values:
1. **`Retain`**  
    → Resource stays. You must manually delete it later.
2. **`Snapshot`**  
    → For snapshot-able resources (e.g., RDS, EBS)  
    → Automatically creates a snapshot before deletion.
3. **`Delete`** (default)  
    → Resource is deleted when stack is deleted or rolled back.

### Important:
- `DeletionPolicy` is per-resource.
- Doesn’t protect from **explicit deletes** outside CloudFormation.
- Doesn’t stop updates that **replace** the resource.