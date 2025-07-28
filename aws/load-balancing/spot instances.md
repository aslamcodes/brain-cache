---
tags: 
type: 
date: 2025-07-22
done: false
---
> A Spot instance is an  unused ec2 instances available for price lower than on demand ec2s

- You can't setup termination protection on spot instances
- Interuption behaviour
	- Stop the instances
	- Hibernate the instances
	- Terminate the instances (default)

> [!NOTE] There is no option for rebooting a spot instances
	 
A "pool" in the context of AWS EC2 Spot Instances refers to a set of unused EC2 instances that share the same characteristics such as instance type (e.g., m5.large), operating system, Availability Zone, and network platform

In short, a pool is a collection of similarly configured, unused EC2 capacity that forms the basis for Spot Instance allocation. More like [[capacity reservation]] concept