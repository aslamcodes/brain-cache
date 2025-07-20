---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

# Unified CloudWatch Agent = single agent for:
- Metrics (like CPU, memory, disk)
- Logs (CloudWatch Logs)

# Before:
- One agent for metrics (old CloudWatch Agent)
- Another for logs (CloudWatch Logs Agent)

# Now (Unified):
- One unified agent replaces both.
- Configurable via JSON or SSM Parameter Store.
- Supports StatsD, CollectD, EC2 and on-prem.

