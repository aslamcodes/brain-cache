---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

CRR - Cross Region Replication
SRR - Same Region Replication

* Buckets can be in different accounts also
* Copying is asyn

CRR - Helpful for compliance and lower latency 
SRR - Live replication between probably environments

> Only new objects gets replicated, S3 batch replication feauture will replicate existing and failed replication


S3 replication isn't chained because replication is a separate event from the original object modification.
Replicated objects don't trigger further replication.


* Optionally, we can replicate delete markers

- Deleting with a version ID (you target a specific version):
    That exact version is removed from the source.
    This is not replicated — the destination bucket still keeps that version.

Replication settings are managed at Manament tab

There are some repliation metrics that when we enabled, can be monitored 
