---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

> A Python script that fefches from the metadata block uses it own logic to perform all of the tasks, simplifying the usedata complexity
![[Udemy ScreenShot 2025-07-03 13-54-15.jpeg]]

https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/cfn-init.html

both cfn-init & cfn-signal script needs to be invoked explicitly from user data script

```
/opt/aws/bin/cfn-init -v --stack STACK_NAME --resource EC2_INSTANCE_LOGICAL_ID --region REGION
```
