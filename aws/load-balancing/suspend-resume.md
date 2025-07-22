---
tags: 
type: 
date: 19th July 2025
done: false
---
There are processes in ASG that we can suspend resume for our conveniences when we are involved in troubleshooting, testing and we don't want to be interrupted by scaling actions

https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html#process-types

suspending \
`AlarmNotification` allows us to temporarily disable target tracking scaling policy without deleting them
`HealthChecks` and `ReplaceUnhealthy` To reboot instances safely 