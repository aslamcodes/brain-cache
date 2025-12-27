---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

# Writing to Read Replica's breaks replication in RDS
- I mean are you even allowed to write?

# **`max_allowed_packet`** parameter
- Determines maximum amount of DML that can be run on the database
- If the max_allowed_packet value for the source DB instance is larger than the max_allowed_packet value for the read replica, the replication process can throw an error and stop replication.
- Replication is only supported for MySQL, InnoDB for MariaDB or XtraDB for MariaDB
- MyISAM is a [[non-transactional storage engines]] storage engine
[[rds]]

> [!WARNING] Read replicas can only work on a transactional storage engine. Using a nontransactional storage engine such as MyISAM can break the replication process.

# `read_only` parameter
- The read_only parameter in MySQL controls whether a server instance allows write operations. 
- This gets used by `_TrueIfReplica_` [[rds formula variables]]

# Unsafe functions break replication
- Using [unsafe statements](https://dev.mysql.com/doc/refman/8.0/en/replication-rbr-safe-unsafe.html) can break the replication such us SLEEP(), SYSDATE(), SYSTEM_USER(), etc - [[SQL Deterministic vs NonDeterministic functions]]