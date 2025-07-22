---
tags: 
type: 
date: 2025-07-22
done: false
---
- Upto 15 read replicas
- Within AZ, Cross AZ or Cross Regional
- Replication is **Async**, from the Master (eventually consistent)
- Read Replicas can be promoted to be a own DB? Gets out of Replication
- Application must update the conn string to leverage read replicas
- Only select operation is allowed, not delete, insert, update
- **Use Case** - Take away load from prod db, for external workload. And it is async. Eg, analytics.