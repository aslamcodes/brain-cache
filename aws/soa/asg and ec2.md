---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

> Client.InternalError: Client error on launch

This error can be caused when an Auto Scaling group attempts to launch an instance that has an encrypted EBS volume, but the service-linked role does not have access to the customer-managed CMK used to encrypt it

