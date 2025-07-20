---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

KMS - AWS Manages the software for encryption
HSM - AWS provisions encryption hardware
We manage our own encryption key entirely, not AWS intervention
HSM device is FIPS 140-2 Level 3 compliance 
Supports both symmetric and asymmetric encryption
No Free tier
Must use CloudHSM client software
Redshift supports CloudHSM for database encryption and key management
Good option for SSE-C encryption


IAM for CRUD in HSM Cluster
CloudHSM software to manage the keys and users

HA - Spread across AZs
One HSM will replicated into other AZ

