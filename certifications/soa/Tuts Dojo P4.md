---
tags: 
type: 
date: 2025-07-28
done: false
---
> [!NTOE] 
> - Are these options related, and not independent
> - Always read the question fully before choosing, and backtrack with your selected ansters
1. ECS is more pricier than that of Lambda
2. Cloudwatch Logs insights to group and analyse multiple queries that can be used to idenitfy patterns
3. You should use event bridge to share a completed snapshot not statemachines.
4. Not NAT idiot, its IGW used to setup Bastion hosts
	1. For you to be able to SSH into your EC2 instances, you must satisfy the following requirements:

		You should have a public IP address or attached an Elastic IP address to your instance.
		
		Your instances should have passed both **system status and instance status** checks to know they are working correctly.
		
		You should have an internet gateway attached to your VPC to allow your instances access to the internet.
		
		You should have a route table that has the appropriate routes entered for all destinations via Internet Gateway. Make sure that there is a default route or a route that specifies your desktop’s IP address to allow communication between instances in the VPC to the Internet or your desktop.

**EC2 Rescue**
- Troubleshoot OS level issues
- Used to gather advanced logs and configuration files
- You create a helper instances
- attach the inaccessible root volume to the health instance
- The helper instance should be
	- in same vpc and subnet
	- Take backup via AMI or snapshot

**IdP**
- IAM role and IAM policy that get's assumed
- IAM idp 

You use MFA for adding security not for strict access. Read the question carefully

If they don't ask anyting about deletion of objects and MFA, don't select them

