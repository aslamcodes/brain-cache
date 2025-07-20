---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Mostly backed up by lambda function or SNS

Define custom provisioning logic 
Define resources not yet supported by cfn
Custom scripts during create/update/deletion

```
AWS::CloudFormation::CustomResource
or
Custom::MyCustomResouce
```

![[Screenshot 2025-07-02 at 10.15.49 PM.png]]

To delete a non empty s3 bucket, you would need to create a lambda function that deletes the objects and then delete the bucket

![[Screenshot 2025-07-02 at 10.17.36 PM.png]]

