---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

What does it mean to say a EBS volume is encrypted, wouldn't that mess up the file system, files? How the OS access it?

When an EBS volume is _encrypted_, it means:
- **Data is encrypted at rest** using AES-256.
- **Data is encrypted in transit** between the volume and EC2 instance.
- **Encryption is transparent to the OS**.
### How it works:
- Encryption happens _below_ the file system level.
- The EC2 hypervisor handles decryption/encryption on-the-fly.
- Your OS reads/writes as usual — no file system corruption or change needed.