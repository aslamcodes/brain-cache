---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

> Intelligent threat discovery to protect your AWS account

Uses ML algos, performs Anamoly detection and third party data

Input data
- Cloudtrail Events logs - Unusualy API calls, unauthorized deployments
	- Management events and data events
- VPC flow logs -Unusaly IP address and traffic
- DNS logs - 
- Optional features - EKS, Lambda, EBS, ...
- Setup Eventbridge rules to automate remediation

> [!NOTE] Exam tip
> Guard duty is better at finding crypto attacks since it has a finding for it

![[Udemy ScreenShot 2025-07-06 22-50-59.webp]]