---
tags: 
type: 
date: 2025-07-22
done: false
---
**Backups**
- Backups are continous and point in time recovery
- Backups have retentions period 0-35 days, 0 means disabled
- Backups happens during maintanence windows
- Backups uses EBS snapshot behind the scenes?
**Snapshots**
- Snapshots takes IO operation
- In multi az, snapshots will be done on the master databse
- Snapshots are incremental
- Snapshots can be copied and shared across accounts
- Don't expire
- Final snapshot when DB is deleted
# Snapshot Sharing
- If the snapshot is encrypted, the CMK has to be shared

Why have both? Both does the same thing?
One is managed, another is manual and preemptive

![[single-to-multi-az.jpeg]]