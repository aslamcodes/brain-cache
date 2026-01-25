---
tags:
type:
date: 2026-01-01
done: false
---
![[AWS PCA-1767288527498.png]]

AWS Private [[Certificate Authority]] let you run your [[PKI Infrastructure]] within your AWS provisions, that is a ROOT CA, Intermediate CA and the trust chain. Just like public key infrastructure, the Root mostly stays inactive, the subordinates performs most of the works. Its your responsibility to **DISTRIBUTE** the root to establish a trust chain