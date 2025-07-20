---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

- New EBS volume will get automatically picked up by the OS
- However extending one we have to extend the file system to a larger size
- Does not care about encryption

When underneath EBS volume size is increased, the file system would not use it. We have to tell the file system to use the new space, maybe partition as needed