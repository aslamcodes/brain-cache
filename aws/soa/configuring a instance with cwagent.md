---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
When I launched an instance these are coming, without configuring any agent. Probably collected via hypervisor

![[Screenshot 2025-07-12 at 15.52.19.png]]

To get metrics like:
- Memory usage
- Disk space and IOPS
- Swap usage
- Processes
- Custom application logs

You need to install the CloudWatch Agent (Unified Agent preferred). It runs inside the instance and pulls OS-level stats.

# Configuring via SSM

![[Screenshot 2025-07-12 at 15.55.42.png]]
![[Screenshot 2025-07-12 at 15.59.42.png]]

![[Screenshot 2025-07-12 at 15.59.49.png]]

![[Screenshot 2025-07-12 at 15.59.55.png]]