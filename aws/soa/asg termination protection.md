---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Protect instances from scale in event
- Desired capacity will be changed
- But the instances won't be terminated
But instance level termination won't be protected
- via terminate-instances api, this need `ec2 termination protection`