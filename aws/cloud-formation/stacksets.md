---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
> stacksets are the way to deploy stacks across multiple regions and accounts with single template
- Requires an ADMIN account (AWS organisation)
- The admin account creates stacksets
- When updated, all the stacks will gets updated
![[Udemy ScreenShot 2025-07-04 15-03-51.jpeg]]
# IAM Permissions
- Self managed - IAM roles with trusted relationship in both admin and target accounts
- Service managed - AWS organisations will take care of this
- AWS organizations will automatically help deploying into new accounts **BUT** Trusted access must be enabled before any delegated admin accounts can deploy into any accounts
![[Udemy ScreenShot 2025-07-04 15-09-17.jpeg]]
- ACM automatically handles the renewal of certificates
- You **can** mix **Spot** and **On-Demand** instances in a **Spot Fleet**, but **not** Spot and **Reserved** instances.