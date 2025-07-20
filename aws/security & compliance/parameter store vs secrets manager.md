---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---


|            | SSM Parameter Store           | Secret manger                       |
| ---------- | ----------------------------- | ----------------------------------- |
| Price      | Less                          | Expensive                           |
| Rotation   | None, can be done via Lambda  | Through lambda                      |
| Encryption | Mandatory encryption with KMS | Optinal via KMS (SecureString Type) |
|            | Can pull a secret with API?   |                                     |

![[parameter store vs secrets manager-1751865572109.jpeg]]