---
tags: 
type: 
date: 2025-07-28
done: false
---
| Feature            | Provisioned                       | Serverless v2                                  |
| ------------------ | --------------------------------- | ---------------------------------------------- |
| Setup Effort       | Medium                            | Low                                            |
| Scaling            | Manual / Read-replica autoscaling | **Automatic, fine-grained**                    |
| Billing Model      | Instance-based, hourly            | **Per-second, usage-based**                    |
| Best For           | Steady-state, high throughput     | **Variable workloads, cost optimization**      |
| Max Capacity       | Tied to instance sizes            | Up to **128 ACUs** (multi-threaded, high IOPS) |
| Minimum Idle Cost  | Always incurs cost                | **Scales to 0** (minimum usage = 0.5 ACUs)     |
| VPC/Network Access | Full control                      | Full VPC support                               |