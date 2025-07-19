---
dg-publish: true
---

https://www.youtube.com/watch?v=ZI5VTUXU4LQ

If you're TOM and you need to assign a role to ec2 instance. You'll need iam:passrole access on that particular role.

Is it a possibility that I can pass a role greater than mine?
**Yes**, it is possible — **if you have `iam:PassRole` on a high-privilege role**, you can **pass a role with permissions greater than yours**, even if **you can't use those permissions directly** yourself.