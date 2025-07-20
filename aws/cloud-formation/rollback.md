---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Stack creation fails:
Two options, can be configures on stack creation (page)
- Everything Roll back (gets deleted) **or**
- Disable rollback for trouble shooting
Stack update fails
- Rollback to last working state
- use logs for debugging
Rollback itself is failing
- Probably due to drift, Fix the drift manually
- Once done "ContinueUpdateRollback" API from console or API or CLI
