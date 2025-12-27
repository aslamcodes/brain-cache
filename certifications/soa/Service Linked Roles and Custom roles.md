---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

- **You create an ASG** → No role specified → AWS checks for `AWSServiceRoleForAutoScaling`.
- If it doesn't exist, **AWS creates it automatically**.    
- All ASGs then share and use this same SLR.

- For only services that act on your behalf
- Some use Resource based policy instead