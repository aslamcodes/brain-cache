---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

cfn uses a service role, that defines what are the resources cfn has access to
cfn service role - dedicated to cfn - allows create/update/deletion

The principal would need to have iam:PassRole. so that the actions can be delegated

If you would need to create a s3 bucket in a account, your IAM policy must have the s3 bucket create access, which gets passed on to the service role for IAM

Nevertheless, the role can be specified at stack creation page, if left empty the user's role would get used