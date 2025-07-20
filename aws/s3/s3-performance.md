---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

S3 Baseline performance
- Latency 100-200ms 
- High request rates

RPS - 3500 PUT/COPY (per prefix)
RPS - 5500 GET/HEAD (per prefix)

for 4 objects

S3 Transfer acceleration
- Use edge location as a mediator

S3 Byte range fetchs
- We can parrallelise downloads by fetching byte ranges for a file, if its so big. 
- Or we can get the header part if we know the bytes 
