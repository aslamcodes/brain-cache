---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

---
dg-publish: true
---
![[policy evaluation-1752904322048.png]]
This image if not carefully interpreted, might mislead you into thinking "Resource based policy or Identity policy". It says See Resource base policies section, but what section

1. **Explicit Deny**: Any explicit deny statement wins above all else
2. **Explicit Allow**: The allows in other policies then take effect
3. **Default Deny**: Anything left unspecified after the above steps is denied

https://builder.aws.com/content/2d1bIioM3UgQZqyaYquu3kTaWAg/comprehensive-guide-of-aws-iam-policy-evaluation-logic

```embed
title: "Policy evaluation for requests within a single account - AWS Identity and Access Management"
image: "https://docs.aws.amazon.com/images/IAM/latest/UserGuide/images/PolicyEvaluationSingleAccountRole.png"
description: "The following flow chart provides details about how a policy evaluation decision is made for an IAM role within a single account. The following flow chart provides details about how a policy evaluation decision is made for an IAM user within a single account."
url: "https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic_policy-eval-basics.html#policy-eval-basics-single-account-user"
```
