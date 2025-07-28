---
tags: 
type: 
date: 2025-07-28
done: false
---
| Traditional RDS                                 | Aurora                                                                                     |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------ |
| Each DB instance has its own local EBS storage. | All DB instances in a cluster share a **single distributed storage volume**.               |
| Storage and compute are tightly coupled.        | Compute (writer/readers) is separate from the underlying **multi-AZ, replicated** storage. |
| Failover requires data replication first.       | Aurora can **promote a replica instantly** because storage is already shared.              |
