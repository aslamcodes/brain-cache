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

https://www.youtube.com/watch?v=wtwUqKvSZDA

Sharing = Modifying permission to add a aws account, much like AMIs
Copying = Actions > Copy. Here's where you can choose which key you want to rencrypt this with

**Share an encrypted snapshot with AWS managed CMK**
- Copy to the same region with a different key
- Modify the permission to add Target AWS account id
- Update the key policies to allow the Target AWS account
- Now you can use the snapshot in target
- But then you can also copy with another key in the target account which would need copy permission enabled

Copying encrypted snapshots across regions 
- 



