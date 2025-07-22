---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
#ami
- AMI is **region specific** since they are stored in **S3**, **AMIs are basically ec2 config + its volume snapshots**
- **No-Reboot** - AMI is taken as the instance is running, Not Application consistent
- **Delete-on-termination** 
- Data cached by application or os might not be stored in ebs snapshots as it only cares about what stored in disks

| EBS Backed          | Instance Store backed |
| ------------------- | --------------------- |
| Supports Start/Stop | No Start/Stop         |
| Data kept in EBS    | Data loss at restart  |

