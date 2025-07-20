---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

---
dg-publish: true
---

EBS does not re-encrypt all the data once the key material got rotated. But ... IDK

> https://www.reddit.com/r/cybersecurity/comments/1cddvtd/encryption_keys_rotation/

Possible answers, but not so sure
- Theres a long master key which is used to encrypt data but then this key is encrypted by operational keys
- EBS tracks which blocks of data gets encrypted with the respective key material