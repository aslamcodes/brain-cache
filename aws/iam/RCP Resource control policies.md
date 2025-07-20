---
tags: 
type: 
date: 2025-07-20
done: false
---
- RCPs acts as **Guardrail** to access of resources in your AWS organization
- It doesn't allow any, by itself, like [[SCP]]s, You'll need to attach [[Identity vs resource policies|IAM resources]]
- RCPs grammar don't support "Deny" statement, its syntax is permissive in nature. 
- All resources that aren't explicitly allowed will not be allowed