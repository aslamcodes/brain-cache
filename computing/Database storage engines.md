---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

# What are storage engines? 
A storage engine is a software component within a database management system (DBMS) that handles the physical storage, retrieval, and management of data
- Determines how data is stored in disk or in memory
- Inflences performance or behaviour
- They handle CRUD on data
- Controls concurrency when there are multiple users accessing the DB
# Transactional Support of a DB Storage Engine
- Refers to ability of a storage engine to handle [[database transactions]] complying [[ACID properties]]
- storage engines like **InnoDB** provide full transactional support with features such as row-level locking, crash recovery, and multi-version concurrency control
# Types of storage engines
- [[non-transactional storage engines]]
- [[transactional storage engines]]