> Cost 20% more than RDS, delivers 5x and 3x performance improvement for MySQL and Postgres respectively

- Cloud Optimised, or AWS Optimised
- Drop in replacement for MySQL and Aurora (The drivers will work)
- Automatically grows upto 128TB from 10GB, no need to worry about size
- Can have upto 15 replicas, in sub-ms replica lag 
- HA Native, Failover is instant

# HA 
- 6 Copies of data across 3 AZ
- Self healing in peer-to-peer replication
- One master instance takes the reads + 15 RR
- When primary instances fail, Aurora failovers to one of the reader instances
- Reader instances are replicated in sync

- Continuos backup to s3

# Aurora DB Cluster
- Writer endpoint is a dns name, when the master fails the dns points to the right master after failover
- Autoscaling canb e setup for Read replicas, Aurora has reader endpoint also. 

# Aurora Backups and Restore
- PITR latest 5mins
- Retention perios 1-35 days, no disabling

# Aurora Backtracking
- In Place restore, unlike backup

# Aurora DB cloning
- Copy on write protocol
- Testing with prod data
- Old data: 

# Encryption
- Using KMS
- If master is not encyrpted, then rr can't be encrypted
- To encrypt an unencrypt db, you'll need to backup and restore with encryption

# Failover
- Assign a priority tier on a read replica
- If two has the priority, auroro promotes the largest one.
- If both have same cap, then random
- RDS can be moved to Auroro
