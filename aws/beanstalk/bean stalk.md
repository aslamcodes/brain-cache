---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

EC2, ELB, Route53, RDS, Elasticache and its PAAS kinda thing

Worker Tier, load balanced with SQS queues, as EC2 instances pull its job
Web Tier, load balanced with request, as requests are forwarded to ec2 instances for processing

Beanstalk is free for use, but you pay for the underlying infrastructure

![[Udemy ScreenShot 2025-07-04 18-21-27.jpeg]]

# Elastic Beanstalk's components
**Application** - The collection of components
Version - An iteration of the application
Environment - AWS resources that are running your application
Tiers: Worker (POLL) and Web server (PUSH)

> [!NOTE] An **Environment** can run only one **application** **version** at a time

![[Udemy ScreenShot 2025-07-04 18-26-40.jpeg]]

Deployment modes
- Single instances (dev)
- HA and LB (prod)
![[Udemy ScreenShot 2025-07-04 18-28-48.jpeg]]

![[Screenshot 2025-07-04 at 18.31.40.png]]

Uses cloudformation behind the scenesQQ