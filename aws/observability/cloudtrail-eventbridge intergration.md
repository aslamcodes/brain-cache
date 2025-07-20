---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

By default the api calls are tracked by cloudtrail which will end up as events in eventbridge which can have rule, which in turn can have targets

![[Udemy ScreenShot 2025-07-01 16-34-10.jpeg]]

But cloudtrail is not real time, it would almost take 15 mintues to log the api call to event bridge and 5 minutes to put into s3 

If cloudtrail is used in a management level, the logs are kept in respective prefixes per account manner