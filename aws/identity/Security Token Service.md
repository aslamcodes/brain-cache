---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Grant limited access to AWS resources via Token

To get the token - API call AssumeRole, AssumeRoleWithSAML (probabbly this is how i'm getting my creds for sandbox account), AssumeRoleWithWebIdentity (use cognito Instread)

Prerequisties
- Must have an IAM role
- Defined allowed principals
- Use STS api to get the temporarry tokens
- Valid upto 15 minutes to 1 hour
![[Udemy ScreenShot 2025-07-06 17-24-08.jpeg]]

# Cross account access with STS

![[Udemy ScreenShot 2025-07-06 17-25-05.jpeg]]