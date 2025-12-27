---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Protection against
- Human Error
- Malicious activity
- Regional disruptions

So for recovery: **Versioning** is the right choice.
For Compliance: **Object Lock**
For Compliance, Resiliency, Redundancy, availability: Replication

Strategies
- Enable S3 versioning
	- can be used to recover objects in case of accidental deletion or overwrites
	- Deletion introduce delete marker
	- Transition older version 
	- Expire older version after not being current version

- Object Lock - Prevents deletion itself and teams cannot really manage the objects
	- WORM model
	- Protection against malicious attacks
	- Also for regulatory requirements
	- Compliance, Legal Hold and Governance

- S3 Bucket Owner condition - **What is this**

- Replicate across buckets 
	- Generally used to safeguard or copy data across buckets

# References
- https://www.youtube.com/watch?v=b18KlhIgmjQ
- https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html
- https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html
- https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-owner-condition.html
- https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html