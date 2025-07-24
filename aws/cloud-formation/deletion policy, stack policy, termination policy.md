---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

# Deletion Policy
- Delete
- Snapshot (Supported services only)
- Retain
> More like lifecycle policy from terraform

> [!NOTE] Deletion would not work on S3 if it has objects
> Either manually delete the objects or develop a custom resource that deletes all objects before deleting the bucket
# Stack policy
- By default all stack updates are applied for all resource
- Stack policy dictates what are allowed on updation
- Protect resources against accidental updates
# Creation Policy
- Used with resources like `AWS::EC2::Instance`.
- Works with `cfn-signal` to **delay resource success** status until signaling is complete.
- Ensures app/config is properly set before marking complete.
	- `AWS::EC2::Instance`
	- `AWS::AutoScaling::AutoScalingGroup`
# Termination protection
- Prevent accidental deletion
- once activated, deletion is prompted termination protection. If you have necessary permission you can delete the resource by editing teh termination 