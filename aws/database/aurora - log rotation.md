---
tags: 
type: 
date: 2025-07-22
done: false
---
> Delete logs on rotation to save storage and avoid performance issues due to large log files
- 15% of the size of DB instance is only allowed for the log files
- Log rotation are done every hour
- Logs older than 30 days are deleted or the oldest log file 
- audit, general and slow query logs are deleted 24 hours / threshold exceeded
- if `log_output` is set to `TABLE`, then the table is truncated