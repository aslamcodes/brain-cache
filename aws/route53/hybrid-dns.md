---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

There is a default DNS resolver available for all VPCs at VPC+2 ip, resolving requests to local ec2 instances, public names servers, and for private host zones

Hybrid-DNS
- Resolving DNS queries across networks such as
	- Peer to peer
	- On prem S2S or DX
- Resolver endpoints
	- Inbound endpoints - Forward from On prem/systems/privatehostedzones to your Route53 resolver
	- Outbound endpoints - Forward to On Prem/systesm/privatehostedzone from your Route53 resolver 
> [!NOTE] Helps removing the need to run your own Resolver on aws and link them to on premises

![[Udemy ScreenShot 2025-06-25 12-37-36-1.jpeg]]
![[Udemy ScreenShot 2025-06-25 12-38-55.jpeg]]