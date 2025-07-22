---
tags: 
type: 
date: 2025-07-22
done: false
---
### For encryption:
- `x-amz-server-side-encryption: AES256` — SSE-S3 (default key)
- `x-amz-server-side-encryption: aws:kms` — SSE-KMS
- `x-amz-server-side-encryption-aws-kms-key-id` — Optional: custom KMS key
### For object uploads:
- `x-amz-storage-class` — e.g., STANDARD, GLACIER, etc.
- `x-amz-acl` — e.g., private, public-read
- `x-amz-meta-*` — Custom metadata
### For conditional requests:
- `If-Match`, `If-None-Match`
- `If-Modified-Since`, `If-Unmodified-Since`