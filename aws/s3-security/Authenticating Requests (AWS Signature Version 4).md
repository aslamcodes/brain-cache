---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
- When you run:
	```
	aws s3 ls
	```
- The AWS CLI:
    1. Gets your access & secret keys
    2. Signs the request (SigV4)
    3. Sends it to AWS
#### 1. **Private access (default):**
- All requests must be **signed** (SigV4).
- Done automatically by SDK/CLI.
- Needed for:
    - Uploads/downloads
    - Listing objects
    - Presigned URLs
#### 2. **Public access (optional):**
- Bucket or object is made public.
- **No signature** needed.
- Anyone can access it via HTTP.