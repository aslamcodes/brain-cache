---
tags: 
type: 
date: 2025-07-24
done: false
---
- `Launch`
	- When terminated no new instances can be launched
	- `AlarmNotification`, `AZRebalance`, `ScheduledActions` would not take effect
	- `ReplaceUnhealthy` terminates the instances but no instances would get launched
	- `InstanceRefresh` would not refresh instances
- `terminate`
	- No scale in `AlarmNotification`, `ScheduledActions`
	- `AZRebalance` would grow upto 10 percent, as old instance would not get terminated
	- `InstanceRefresh` would not refresh instances
> [!NOTE] `ReplaceUnhealthy` process calls `Terminate` first and then `Launch`. suspending one of them will not have effect on other.
- [and more](https://docs.aws.amazon.com/autoscaling/ec2/userguide/understand-how-suspending-processes-affects-other-processes.html#terminate-is-suspended)