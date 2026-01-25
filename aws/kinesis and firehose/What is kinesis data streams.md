---
tags:
type:
date: 2026-01-22
done: false
---
![[What is kinesis data streams-1769084121497.png]]

![[What is kinesis data streams-1769084141099.png]]

# Data streams
- collect and ingest data in real time data from 100s and 1000s of sources.
- data can be retained for 365 days -> consumers can replay it
- data can't be deleted from kinesis until expiry
- best practice is to send lot of small data, but kinesis lets you inject upto 1MB of data
- data with same partition id is guaranteed to be in order
- at rest KMS encryption, at flight HTTPS encryption

Write optimised Kinesis Application, use
KPL - Kinesis Producer Library
KCL - Kinesis Consumer Library

# Producers
- Kinesis Agent can be installed within the servers that serves as producers for metrics and logs
- Applications can be configured to send records via `PutRecord` API
![[What is kinesis data streams-1769176957716.png]]

# Consumers
- Managed Apache Flink
- Lambda or an Application
- [[What is Kinesis Firehose Stream|data firehose]]  
![[What is kinesis data streams-1769176973826.png]]


# Provisioned Mode
> Shard - A shard is unrelated to other shard definition, is the base unit of throughput; Shards constitutes to overall throughput composition for YOUR aws kinesis data stream

🫰 Pay per shard provisioned per hour

A Shard's throughput
- write capacity - Support up to 1MB/s and 1000records/second (ie 1000 one KB records or one 1MB record at a time) 
- read capacity - scale up to 2MB/s

That is, if you are planning for 4MBs write throughput, you provision 4 shards

> [!NOTE] Configuration
> Once the data stream is provisioned, it can be updated in the configuration pane (**shards can be only doubled, ie from 1 to 2, not 3**)
   ![[What is kinesis data streams-1769177092062.png]]
# On Demand
- Defaults at 4MB/s, scales automatically based on the observed throughput for the past 30days

🫰 Pay stream per hour & data in/out in GB
