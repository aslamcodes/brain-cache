---
tags: 
type: 
date: 2025-07-22
done: false
---
| Feature          | Basic Monitoring                       | Enhanced Monitoring                 |
| ---------------- | -------------------------------------- | ----------------------------------- |
| Interval         | 1 or 5 minutes                         | 1–60 seconds                        |
| Metrics          | DB-level only (CPU, IOPS, connections) | OS-level (RAM, disk I/O, processes) |
| Agent Needed     | No                                     | Yes (AWS-managed)                   |
| Logs Destination | CloudWatch                             | CloudWatch Logs                     |
| Cost             | Free                                   | Pay for Logs usage                  |
