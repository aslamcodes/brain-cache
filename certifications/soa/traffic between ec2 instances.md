---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

#ec2 #networking

If two instances cummunicate with public ip address, either
1. Traffic between EC2 instances in
	- **different AWS Regions stays within the AWS network**
	- if there is an **Inter-Region** VPC Peering connection between the VPCs where the two instances reside.
2. Traffic between EC2 instances in 
	- **different AWS Regions** where 
	- there is **no Inter-Region** VPC Peering connection between the VPCs where these instances reside, 
	- **is not guaranteed to stay within the AWS network.**
3. Traffic between two EC2 instances in the **same AWS Region** stays within the AWS network, even when it goes over **public IP addresses.**
	- AWS does some networking hacks to do this, so that it may be fast

Same region = stays within aws both public and private
Different region = stays **may/may not** if inter region connection is there