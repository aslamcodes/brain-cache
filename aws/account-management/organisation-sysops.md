---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

# Billing
All accouns in a aws organisation is treated as one account for billing
If you purchase RI from any other account, any other account can enjoy it
This can be disabled in the Management acocunt

> [!NOTE] To share the RI benefits between accounts, both accounts must have sharing turned on

# IAM
`aws:PrincipalOrgId` this key can be used to allow any users from an organisation
![[Udemy ScreenShot 2025-07-04 17-45-07.jpeg]]

# Tagging Policies
- Helps standardizing tags across all aws accounts
- Define tag keys and allowed values
- Helps with cost allocation tags and attribute based access control (ABAC)
- 