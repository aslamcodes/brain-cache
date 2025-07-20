---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

# Changing KMS key for encrypted EBS volume
- This can't done straightforward way
- Create a encrypted snapshot
- Create encrypted volume out of the snapshot with the new key
- AWS manages re-encryption

![[Udemy ScreenShot 2025-07-07 09-33-33.webp]]

- Reencryption -> Decrypt all the data and Encrypt all the data. this happens everytime we chose to copy with different KMS keys
# Sharing KMS Encrypted RDS DB Snapshots
- The key must shared with respective accounts with key policies
![[Udemy ScreenShot 2025-07-07 09-35-09.webp]]

# KMS Key deletion
- Schedule CMK for deletion
- waiting period for 7 to 30 days
- Pending deletion state - The key cannot be used for cyrpto operations
- Any scheduled key rotation will not happen
- Can cancel key deletion in the waiting period
- Disable the key first, before deletion if you're not sure
- Cloudwatch alarm can be used for automation here
![[Udemy ScreenShot 2025-07-07 09-37-56.webp]]