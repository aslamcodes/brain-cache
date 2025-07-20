---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
```embed
title: "storagegateway"
image: ""
description: ""
url: "https://docs.aws.amazon.com/storagegateway/"
```
![[storage-gateway-1752992551813.jpeg]]
# Storage Cloud
- Hybrid cloud (Partly aws and on prem)
- How would expose s3 data to on prem? Storage Gateway
- Bridge bw on prem data and cloud data
- Gateway software has to be run on the on prem. By virtualisation or by hardware

**S3 file gateway**
- The most recently used objects will be cached in file gateway.  
- IAM roles need to be created for the filegateway to access S3. 
![[file-gateway.jpeg]]

**Volume Gateway**
- Block storage by iSCSI protocol backed by s3
- Backed by EBS snapshots
- Cached volumes
- Stored volumes
-  Backup your on prem volumes to s3

**FSX file gateway**
- You'd get default access for Fsx in on prem
- This is just to have some cache
## Ops
- Activations - Public via port 80 or generate via console if ip is not available
- Monitor CacheHitPercent and CachePercentUse
 ![[cache-storage-gatway.jpeg]]