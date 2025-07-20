---
dg-publish: true
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

# To suspend a process
- Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/, and choose Auto Scaling Groups from the navigation pane.
- Select the check box next to the Auto Scaling group.
- A split pane opens up in the bottom of the page.
- On the Details tab, choose Advanced configurations, Edit.
- For Suspended processes, choose the process to suspend.
- Choose Update.
**To Resume a process**
- Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/, and choose Auto Scaling Groups from the navigation pane.
- Select the check box next to the Auto Scaling group.
- A split pane opens up in the bottom of the page.
- On the Details tab, choose Advanced configurations, Edit.
- For Suspended processes, remove the suspended process.
- Choose Update.
