---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Used to trigger notifications for any metric using various options (max, min)
## Alarm states
- OK
- INSUFFICIENT DATA
- ALARM
## Alarm Targets:
- EC2 - Stop, Terminate, Reboot, Recover
- Trigger auto scaling
- SNS
## Composite Alarms
-  Monitor states of multiple alarms, using boolean ops, AND, OR conditions
- Alarm noice can be reduced with this
## EC2 Recovery
- EC2 instance is failed some status checks which can be monitored via cloudwatch, then **recovery action** can be triggerd 