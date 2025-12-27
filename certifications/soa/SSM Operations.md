---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

# Avoid using internet
- Instances should be in private subnet
- Don't use NAT or IGW, which is actually using internet to connect to SSM endpoint
- Attach a VPCe for SSM into the VPC, so that SSM traffic stays within the network

![[SSM-1752323544957.png]]