# Storage Cloud
- Hybrid cloud (Partly aws and on prem)
- How would expose s3 data to on prem? Storage Gateway
- Bridge bw on prem data and cloud data

Gateway has to be run on the on prem. By virtualisation or by hardware
# Types

**S3 file gateway**
The most recently used objects will be cached in file gateway.  IAM roles need to be created for the filegateway to access S3. 
![[file-gateway.jpeg]]

**Volume Gateway**
- Block storage by iSCSI protocol backed by s3
- Backed by EBS snapshots
- Cached volumes
- Stored volumes
Backup your on prem volumes to s3

**FSX file gateway**
- You'd get default access for Fsx in on prem
- This is just to have some cache

TLDR 
![[Udemy ScreenShot 2025-06-02 06-18-37.jpeg]]

## Ops
- Activations - Public via port 80 or generate via console if ip is not available
- Monitor CacheHitPercent and CachePercentUse
- ![[cache-storage-gatway.jpeg]]