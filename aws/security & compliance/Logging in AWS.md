---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Service Logs
- Cloudtrail API logs
- Config rules - track config and compliance over time
- Cloudwatch logs - for full data retention
- VPC Flow logs - IP traffic within VPC
- ELB Access logs - Metadata of request made to ELB
- Cloudfront logs - Logs from distribution
- WAF Logs - Full loging of all requests

S3 Access logs?

All these logs can be put in S3 and analyzed with athena and it is great to encrypt these logs when you put it on s3 and move to glacier for cost saving