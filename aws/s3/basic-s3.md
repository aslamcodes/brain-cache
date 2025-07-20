---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Stores file as objects
Name must be globally unique accorss all regions and acounts
But S3 buckets created regional level

Key = Prefix + Object name

There's no directories, but UI makes you think so


# Objects
Max object size - 5TB
If uploading a file more that 5GB, it must be uploaded as "Multi-part upload"
Has version ID if versioning is enabled

# Versioning
- Versioning on a key
- Deleting a object is just a deletion marker, previous versions can be restored even after delete
- This is best practice
- Deleting the delete marker will restore the object that is intended to be deleted


