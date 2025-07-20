---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---



> AWS Manages the encryption keys for us

- Fully integrated with IAM
- Audit and track on API calls with CloudTrail
- Integrated with pretty much all the services that requires encryption
- Idea: Never ever store the key in plain text, but store in Runtime
-  KMS keys are available through API calls

# KMS key types
- AWS Owned keys, SSE-S3, SSE-SQS, SSE-DDB
- AWS Managed keys, aws/ebs, aws/rds
- Customer managed keys 1$ per month + Each API call made to the service 3cents / 1000 calls

 CMK is more like a **container** for the actual key + its control info.