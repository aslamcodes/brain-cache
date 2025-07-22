---
tags: 
type: 
date: 2025-07-22
done: false
---
> prevent objects from getting deleted accidentally for a fixed amount of time or indefinitely

> [!NOTE] S3 Object Lock has been assessed by Cohasset Associates for use in environments that are subject to SEC 17a-4, CFTC, and FINRA regulations.

# Two ways
 Works only when versioning is enabled
- Retentions period
	- Unique + default retention period for objects + s3 bucket
- Legal Hold
	- Same as Retentions period but no expiration 
# Retention Modes
- Compliance - 
	- meme - "Son, listen once you get in there's no going back"
	- You can't change anything even if your a root user
- Governance
	- This is unlike compliance, you can give some users special permission to overwrite 
- 