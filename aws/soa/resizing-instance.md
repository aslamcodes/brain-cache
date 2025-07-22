---
tags: 
type: 
date: 19th July 2025
done: false
---

#ec2
- Instances backed with instance store will lose its data as its ephemeral
- There will be downtime while resizing, downtime to be planned
- EIP alone is persisted, both private and public ip
- If instance in ASG, it would label the instance as unhealthy and may terminate the instance 
 > Re-sizing an instance IS NOT POSSIBLE as instance store is attached to the hardware
