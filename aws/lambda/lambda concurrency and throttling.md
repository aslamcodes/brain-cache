---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

concurrency can be controlled as Lambda can scale up to 1000GB

Throttle behaviour
Synchronous invocation - returns ThrottleError
Asynchronous invocation - DLQ (needs to be configured), retry up to 6 hours at exponentialy from 1 second to 5 seconds
	By default, Lambda retries a failed asynchronous invocation up to two times

Concurrently Issue
- If one function in the account goes over the limit, the other functions possibly get throttled
- It is recommended reserve =limit concurrency

**Provisioned Concurrency**
Cold Start - The cold has to be loaded, many dependencies, code outside the lambda handler, the process can take some time to serve the first connection
So **allocate concurrency** before any invocations
