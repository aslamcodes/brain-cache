---
tags:
type:
date: 2026-01-25
done: false
---
> Difference is that is the capacity is abstracted from us.

Even though the capacity is abstracted away from you, you still can think about the underlying capacity in terms of worker capacity, pre-initialized capacity, just like [[lambda performance|provisioned concurrency from lambda]]

 You no longer need to think about the number of workers (provisioned shards) as its taken care by EMR now

![[emr serverless-1769351074744.png]]

## Application Lifecycle

1. The EMR application has to be created with `CreateApplicationAPI`

The three possible states 1. creating, created and terminated. 
![[emr serverless-1769351147441.png]]

2. The application has to be started with `StartApplication` API, but it can also be terminated right after created with `DeleteApplication` API

![[emr serverless-1769351216379.png]]

3. After starting the application with the start command, two possibilities can happen
	1. if there are no failures, it goes to started phase -> stopping -> stopped
	2. if there are failures, it goes straight to stopping -> stopped
![[emr serverless-1769351258984.png]]

![[emr serverless-1769351702736.png|302x283]]
# Pre-initialized capacity
![[emr serverless-1769351713592.png|240x374]]