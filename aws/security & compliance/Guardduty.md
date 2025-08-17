---
tags: 
type: 
date: 19th July 2025
done: false
---
> Intelligent threat discovery to protect your AWS account, Uses ML algorithms, performs Anamaly detection on third party data
**Input data**
- CloudTrail Events logs - Unusual API calls, unauthorized deployments, Management events and data events
- VPC flow logs - Unusual IP address and traffic
- Route53 DNS logs  
Provides malware protection for EC2 instances, by taking the snapshot of the particular EBS volume and removes it after scanning. You can optionally keep the snapshot if you want.
Provides malware protection for S3 

supports Runtime monitoring

![[Guardduty-1754630002976.png]]

> [!NOTE] Exam tip
> Guard duty is better at finding crypto attacks since it has a finding for it

![[Udemy ScreenShot 2025-07-06 22-50-59.webp]]
# Multi Account Setup
- We can setup GuardDuty centrally in a AWS organization. it needs a delegated admin account, not necessarily the admin account.
- With the delegated admin account, you can add or remove accounts that you want to track with GuardDuty
![[Guardduty-1754795550469.png]]
# Findings
Any findings in GuardDuty will be sent to EventBridge, from there you can setup remediation action with rules and targets

> [!NOTE] Events are published to both Admin and the Origin account

# GuardDuty Architectures
1. Setup a lambda function as target that updates WAF or instance's NACL when some IP tries to bruteforce SSH
2. Block the IP in VPC Network firewall via a lambda function if the IP is found in common bad actings
# Threat list and Trusted IP List
🤦
# Supression Fiters
🤷