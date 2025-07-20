---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Execution context is a temporary runtime environment that intialises any external depenedencies such as HTTP clients, database connection, SDK clients

The context is maintained for sometime as next invokation is anticipated, as it can reuse the context

![[Udemy ScreenShot 2025-07-02 00-05-55.jpeg]]

Execution context includes /tmp directory max 10GB of diskspace
Permanent persistence -> s3, temporary -> /tmp
For encryption you must have to go with KMS data keys

