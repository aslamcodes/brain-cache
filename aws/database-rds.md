Relational Database Service

# Database engines
- Postgres
- MySQL
- MariaDB
- Oracle
- Microsoft SQL server
- IBD DB2
- Aurora

# RDS proxy
- Maintains the connection pool for us
- Supports Auto Scaling for connections

# RDS Parameter Groups
- Static Parameters required instance reboot, dynamic is applied instanty
- Group of parameters to apply to the DB engine 

>  "When you associate a new DB parameter group with a DB instance, the modified static and dynamic parameters are applied only after the DB instance is rebooted.
    However, if you modify dynamic parameters in the DB parameter group after you associate it with the DB instance,
    these changes are applied immediately without a reboot."

# DB on Ec2 vs RDS
RDS - Managed Service
OS patching and provisioning taken care by aws
Continuos Backups and Point in time restore
Read Replicas
Multi AZ setup
Scaling (H and V) & Auto scaling
Monitoring Dashboards
Storage is backed by EBS

# 🚨 Read Replicas
Upto 15 read replicas
Within AZ, Cross AZ or Cross Regional
Replication is **Async**, from the Master (eventually consistent)
Read Replicas can be promoted to be a own DB? Gets out of Replication
Application must update the conn string to leverage read replica
Only select, not delete, insert, update

Use Case - Take away load from prod db, for external workload. And it is async. Eg, analytics.

## Cost
No need to pay between AZs in same region
Cross region - Incur costs

# Multi-AZ
For Disaster recovery only
**SYNC** replication to a standby instance
Automatic failover
Increases availability
No Manual intervention required

Multi AZ reduces downtimes caused by version upgrades, backup snapshots.

> Read Replica as Multi AZ

# Failover Conditions in Multi-AZ
- Primary DB is failed
- Primary DB is in software patching
- Unreachable due to loss of Network Connectivity (AZ)
- Changing the instance type
- Busy and Unresponsive
- Underylying storage failure

- Az outage
- Manual Failover (reboot with failover)

# How to go from Single AZ to Multi AZ
- Zero Downtime operation
- Can be done on console
[[single-to-multi-az]]

# RDS Backups vs Snapshot
- Backups are continous and point in time recovery
- Backups have retentions period 0-35 days, 0 means disabled
- Backups happens during maintanence windows
- Backups uses EBS snapshot behind the scenes?

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

# RDS Events and Logs
- RDS delivers it events to eventbridge and SNS topics can be setup
- RDS logs can be sent to cloudwatch, then metric filter, then alarm, then SNS, then Admin

# Monitoring w Cloudwatch
From Hypervisor
- Basic metrics

From an agent (Enabled Enhanced Monitoring)
- Lot of metrics

# RDS Performance Insights
-  
