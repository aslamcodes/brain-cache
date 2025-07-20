---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

---
dg-publish: true
tags: 
type: 
date: "19th July 2025"
---
> Pass advanced session policies when you use the AWS CLI or AWS API to assume a role or a federated user.

> Session policies are advanced policies that you pass as a parameter when you programmatically create a temporary session for a role or an AWS STS federated user principal

- Using `AssumeRole`, `AssumeRoleWithSAML`, or `AssumeRoleWithWebIdentity

```bash
aws sts assume-role \
  --role-arn arn:aws:iam::123456789012:role/ExampleRole \
  --role-session-name session1 \
  --policy file://session-policy.json

```
