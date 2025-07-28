---
tags: 
type: 
date: 2025-07-22
done: false
---
- Static Parameters required instance reboot, dynamic is applied instanty
- Group of parameters to apply to the DB engine 
# Static vs Dynamic Parameters 
- When you associate a new DB parameter group with a DB instance, the modified static parameters are applied only after the **DB instance or the cluster** is rebooted. 
 - **However**, if you modify dynamic parameters in the DB parameter group after you associate it with the DB instance, these changes are applied immediately without a reboot.
# Parameter groups's ApplyMethod