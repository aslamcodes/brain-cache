---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
Execution context is a temporary runtime environment that initializes any external dependencies such as HTTP clients, database connection, SDK clients

The context is maintained for sometime as next invocation is anticipated, as it can reuse the context

![[Udemy ScreenShot 2025-07-02 00-05-55.jpeg]]

Execution context includes `/tmp` directory max 10GB of disk-space. The tmp directory's lifespan is around warm invokations

lambda's temporary storage shouldn't be used for persistence, for these you can go for s3, file systems or DBs

For encryption you must have to go with KMS data keys