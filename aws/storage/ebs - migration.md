---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

---
dg-publish: true
---

- EBS volumes are AZ scoped, since they are often scoped to hardware
- To migrate a volume to another AZ
    1. Take a snapshot of that EBS
    2. Create EBS out of snapshot (since snapshots are stored in s3)

# Across regions
![[Udemy ScreenShot 2025-07-07 09-09-20.webp]]
# Across accounts
- Use a KMS key with cross account access
- Share the encrypted snapshot with target account
- Create a copy from the snapshot in the target account with a cmk in that account

![[Udemy ScreenShot 2025-07-07 09-11-43.webp]]