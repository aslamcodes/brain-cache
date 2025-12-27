---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
> **Highly available** means the system remains **operational with minimal downtime**, even during **failures**. It uses **redundancy, failover, and monitoring** to ensure uptime.

Configuring your app with appropriate TTL is always followed after Configuring Multi AZ deployment

**HA vs Scalable**
- **Scaling** handles **load increases** (horizontal/vertical).
- **High availability** ensures uptime.

Backups do not make the architecture highly available. **Backups** are for **data recovery** (disaster recovery, data loss).
Backups help with **durability**, not **availability**.

[[single-to-multi-az]]
[[rds]]

# How applications should handle RDS failover in case of AZ failure
- **Set low DNS cache TTL**
- **Enable TCP retry logic in app**
- **Use the RDS endpoint (not IP)**

how to create a multi az deployment
- At the time of creating
- Conver exiting DB instance to multi az by modifiying the DB instance