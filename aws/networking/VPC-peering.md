---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

> [!DANGER] Even if VPCs are peered, the subnet's route table are configured to route to igw if it doesn't fall under the vpc cidr (10.0.0.0/8 -> local & 0.0.0.0/0 -> igw if public). you'd need to add an entry to vpc entry in all subnets if routing is required

VPC is not transitive in nature, but how?

VPC A -> VPC B 
VPC B -> VPC C

Why not VPC A can't connect to B?

VPC A, is not going to be aware of VPC B to C peering connections.

