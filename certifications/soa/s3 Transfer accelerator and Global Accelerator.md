---
tags: 
type: 
date: 2025-07-27
done: false
---
> **Amazon S3 Transfer Acceleration** is a bucket-level feature that enables fast, easy, and secure transfers of files over long distances between your client and an S3 bucket. Transfer Acceleration takes advantage of the globally distributed edge locations in Amazon CloudFront. As the data arrives at an edge location, the data is routed to Amazon S3 over an optimized network path.

![[s3ta-1753613599348.png]]


Global Accelerator works with: 
	Elastic IPs
	ALB / NLB (Application/Network Load Balancers)
	EC2 instances
	AWS services reachable via IP

> [!NOTE] S3 is a distributed service, its not one off services like ec2 instances, that's why its physically it required AWS to create two different service