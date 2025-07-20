---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

- Health checks are only for public resources
- Help with automated DNS failover 

Possible health checks
- **monitor an endpoint**
    - From 15 different global health checkers ie regions based on 200 response; if 18 percent is healthy then its going to be healthy
     - Also can be setup based on text for the first 5120 bytes
- **monitor other health checks**
	![[Udemy ScreenShot 2025-06-25 11-13-58.jpeg]]
**monitor a cloudwatch alarm - Gives you full control**
    - If you have some resources such as DynamoDB, Ec2 instances configured to have alarm based on its resource utilization, we can configure to monitor the alarm for health check

# Private hosted zones
- Cloudwatch metric -> cloudwatch -> alarm  <- Route53 health checker

# Configuring health checks
 ![[Screenshot 2025-06-25 at 11.19.51.png]]
