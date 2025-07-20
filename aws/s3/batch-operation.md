---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

# Source
Source can be manifest.json from other batch operation, a CSV file or create manifest on the fly (assuming)
We can use s3 inventory to generate a list and use athena to query and pass it to batch operations 

# Batch Operation type

Copy - Copies every object to the specified destination.

Invoke AWS Lambda function - AWS Lambda is a compute service that lets you run code without provisioning or managing servers.

Replace all object tags - Replaces the Amazon S3 object tags on every object.

Delete all object tags - Deletes the Amazon S3 object tags on every object.

Replace access control list (ACL) - Replaces the Amazon S3 access control lists (ACLs) for every object.

Restore - Initiates restore requests for archived objects.

Object Lock retention - Prevents objects from being deleted or overwritten for a fixed amount of time.

Object Lock legal hold - Prevents objects from being deleted or overwritten until the legal hold is removed.

Replicate - Replicates every object to the destinations specified in the replication configuration.
