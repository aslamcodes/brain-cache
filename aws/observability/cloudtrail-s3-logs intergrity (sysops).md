---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

When cloudtrail logs are exported to s3, cloud trail maintains the logs in files, and a digest file

The digest file will contain hashes, will help in verifying intergrity of a file

But also Protect the s3 bucket with Object lock, policies, MFA deletion protection, versioning

Cloudtrail would also need to protected via IAM. 