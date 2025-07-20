---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

#ami 
**Points to remember**
AMI - Instance config data + EBS snapshots
EBS Snapshots - stored in S3
With Encryption
- Cross account - Share the key and give access to the key
- Cross region - Key has to be replicated in the region too [[KMS - Key Management Service]]
- If snapshots are encrypted with aws managed keys (aws/ebs) you cannot share it, since these keys are account specific and controlled by AWS
there's a limit on how many shared amis that you can have 

Share vs Copy
- AMI are regional resource so Snapshots can't be referenced across regions, it needs to be copied

Sharing AMI across AZ
Sharing AMI across Regions
Sharing AMI snapshots across Account

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/sharingamis-explicit.html