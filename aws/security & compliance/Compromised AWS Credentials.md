---
tags:
type:
date: 2025-09-22
done: false
---
# IAM User
****- Identify via [[Guardduty]]
- Rotate the creds
- invalidate the STS creds with a date sts condition
# IAM Role
- Identify via [[Guardduty]]
- Invalidate STS tokens with a data STS condition
# Account
-  Identify via [[Guardduty]]
- Rotate or Delete all AWS Access keys
- Rotate all of the IAM users credentials
- Delete and Rotate all EC2 keypairs