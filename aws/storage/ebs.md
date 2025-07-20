---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

- Network attached storage, without the OS knowing
- Persists data even if you want, after termination. And The same ec2 can be recreated
- EBS volumes are bound to AZ, hardware scoped
- "network USB stick", detach/attach
- EBS can be left unattached

-> Delete on termination, default for root volume. Other is disabled
-> Since network is used, there might be a bit of latency
-> Use EBS snapshots if you want to move across AZ


