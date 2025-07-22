---
tags: 
type: 
date: 2025-07-22
done: false
---
- For Disaster recovery only
- **SYNC** replication to a standby instance
- Automatic failover
- Increases availability
- No Manual intervention required
Multi AZ reduces downtimes caused by version upgrades, backup snapshots.
# Failover Conditions in Multi-AZ
- Primary DB is failed
- Primary DB is in software patching
- Unreachable due to loss of Network Connectivity (AZ)
- Changing the instance type
- Busy and Unresponsive
- Underlying storage failure
- Az outage
- Manual Failover (reboot with failover)
# How to go from Single AZ to Multi AZ
- Zero Downtime operation
- Can be done on console