---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

- KMS keys are region specific, probably due to the fact that the services that rely on KMS are mostly region specific
- Means they are like EC2 instances
- Even if you have same KMS **alias** in different region, inherently its a different key

**Multi Region key MRK**
- https://www.youtube.com/watch?v=igikgFCd48g
- Decided on key creation time whether the Key is regional or multi regional
- After creating a MRK we would need to specify which region we need to replicate to
- Easily move data without re-encryption

 ![[KMS region-1752341760799.png]]