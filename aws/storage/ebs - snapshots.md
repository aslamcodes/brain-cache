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

- Point in time Backup for EBS Volumes
- Recommened to shut off instance, before snapshotting
- Can be copied to AZ, and can be restored

-> EBS snapshots are internally stored in amazon s3
-> FSR (expensive): Since EBS are stored at s3, intilisation happens progressively. dd or fio commands can be used or FSR can be used

- Move snapshot to archive tier, to save 70% of costs, takes 22 to 72 hours
- Retention period can be setup for accidental deletion

> EBS Snapshots can be automated with Amazon Data Lifecycle Manager, AWS backups is recent and more general service