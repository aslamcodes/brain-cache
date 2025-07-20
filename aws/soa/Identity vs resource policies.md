---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

- **Both identity-based and resource-based policies must allow** access if both exist.
 
- **Explicit deny overrides all allows** in either policy.
    
- **If a policy is silent on an action**, it’s treated as **implicit deny**.??????
    
- **“Exists”** means the policy is **attached and applicable** (identity or resource level).
    
- **Not all resources have resource-based policies by default**.
    
- **Resource-based policies must be explicitly attached** to be evaluated.
    
- **Some AWS services don’t support resource-based policies** (e.g., EC2, RDS).
    
- **S3 buckets can have no resource-based policy**, in which case access is controlled only by IAM (identity-based) policies.

> **Explicit deny always overrides any allow, and if there is no explicit allow, access is implicitly denied**

| **Service**         | **Supports Resource-Based Policy?** | **Evaluation Rule**                                                                |
| ------------------- | ----------------------------------- | ---------------------------------------------------------------------------------- |
| **S3**              | ✅ Yes                               | **Both identity & resource policy must allow** if resource policy exists           |
| **Lambda**          | ✅ Yes                               | Same as S3: **both must allow** if resource policy is present                      |
| **SNS/SQS**         | ✅ Yes                               | **Both must allow** if resource policy is attached                                 |
| **KMS**             | ✅ Yes                               | **Both must allow**, identity policy alone isn't enough                            |
| **EC2**             | ❌ No                                | Only **identity-based** policy is evaluated                                        |
| **RDS**             | ❌ No                                | Only **identity-based** policy is evaluated                                        |
| **DynamoDB**        | ❌ No                                | Only **identity-based** policy is evaluated                                        |
| **IAM**             | ✅ (Trust policy, not access policy) | **Identity-based only** for actions like CreateUser; Trust policy for AssumeRole   |
| **Secrets Manager** | ✅ Yes                               | Both may be evaluated; **resource policy often required for cross-account access** |
| **S3 (Public)**     | ✅ Yes                               | Resource-based policy can grant access **without IAM**, for anonymous access       |