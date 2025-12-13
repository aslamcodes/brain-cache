---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
Manage multiple aws accounts at the same time
The main account is organisation account
Members can be on only one account
the billing is consolidated across all the accounts
Pricing benefits from aggregated usages
APIs for account creation automation

![[Udemy ScreenShot 2025-07-04 17-27-44.jpeg]]

# Benefits
- Send all the cloudtrail & cloudwatch logs to central s3 account
- Multi Account is better than Multiple VPC
- Enforce tagging standards

**SCP**
- IAM policies applied to OU or accounts that restrict all IAM roles and users
- They don't apply for management account for obvious reasons
- The ROOT OU should have Full management access