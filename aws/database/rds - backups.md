---
tags: 
type: 
date: 2025-07-22
done: false
---
There are two ways
- manual (snapshots or via [[aws backups]])
- automated (1 - 35 days)

# Recovery
1. Automated
	1. AWS Console → RDS → "Restore to point in time".
	2. Creates a **new DB instance** from the backup + logs.
2. Manual
	1. Console → RDS → Snapshots → Select → “Restore Snapshot”.
	2. Creates a new DB instance from that snapshot.

	3. Backup console → Recovery points → “Restore”
	4. Also creates a new RDS instance.

# When
- Single AZ
	- Backup takes I/O
	- PITR and snapshots
- Muliti AZ
	- Takes from standby instance, no I/O effects
	- PIRT and Snapshots
- RR
	- Replicas aren't used for backups, still taken from primary instance, partly because replication is async
	- Why would you back up a back up (kinda)
	- If you want, promote to master and take it from there