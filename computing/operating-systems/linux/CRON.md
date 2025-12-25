---
tags:
type:
date: 2025-12-25
done: false
---
> [!NOTE] Be aware of Timezone nuances, when you are working with Time

> **cron** = time; **tab** = table

Time based job scheduler in Unix-like Operating Systems. The `crond` is the daemon that's responsible for executing these jobs automatically. `systemctl status crond` to check the statuses, `journalctl -u cron` for logs (`journalctl -u cron | grep root`)

```
* * * * * command_to_execute
│ │ │ │ │
│ │ │ │ └─── Day of week (0-7, both 0 and 7 are Sunday)
│ │ │ └───── Month (1-12)
│ │ └─────── Day of month (1-31)
│ └───────── Hour (0-23)
└─────────── Minute (0-59)
```
### Installation
The `cronie` package provides the modern implementation of cron, used on many distros. It provides the `crond` daemon, and replaces old **Vixie Cron**. Features PAM, systemd support
### Common Time Examples
- `0 2 * * *` - Run at 2:00 AM every day
- `*/15 * * * *` - Run every 15 minutes
- `0 0 * * 0` - Run at midnight every Sunday
- `30 6 * * 1-5` - Run at 6:30 AM on weekdays
- `0 */4 * * *` - Run every 4 hours
- `0 9 1 * *` - Run at 9:00 AM on the first day of every month
### System crons
System crons run as root, defined in these areas. `journalctl -u cron | grep root` provides you with logs of jobs run by the root
- `/etc/cron.hourly/` - Run hourly
- `/etc/cron.daily/` - Run daily
- `/etc/cron.weekly/` - Run weekly
- `/etc/cron.monthly/` - Run monthly
### Crontab utility
The crontab utility lets users manage their own time schedule, that is each users gets their own individual schedule, when they are logged in

**Edit your crontab**
```sh
crontab -e 
```

**List your crontab**
```sh
crontab -l
```
**Edit another user crontab as root**
```sh
crontab -u username -e
```
### Best Practices
- Ensure your scripts have executable permissions
- Test before setting the scripts
- Use Absolute Paths
- Use anacron for non 24/7 systems
- Set required environment variables at the top of your crontab (bonus: set mailto for notification)
```sh
SHELL=/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin
MAILTO=admin@example.com

0 2 * * * /home/user/scripts/backup.sh
```
- Redirect output to files 
```sh
# Log everything
0 2 * * * /path/to/script.sh >> /var/log/myjob.log 2>&1

# Separate error logs
0 2 * * * /path/to/script.sh >> /var/log/myjob.log 2>> /var/log/myjob_error.log

# Suppress output
0 2 * * * /path/to/script.sh > /dev/null 2>&1
```
- Use comments to document
```sh
# Daily database backup at 2 AM
0 2 * * * /usr/local/bin/backup_db.sh

# Clear temp files every 6 hours
0 */6 * * * /usr/bin/find /tmp -type f -atime +7 -delete
```
### Special Strings
- `@reboot` - Run once at startup
- `@yearly` or `@annually` - Run once a year (0 0 1 1 *)
- `@monthly` - Run once a month (0 0 1 * *)
- `@weekly` - Run once a week (0 0 * * 0)
- `@daily` or `@midnight` - Run once a day (0 0 * * *)
- `@hourly` - Run once an hour (0 * * * *)
**Examples**
```
@reboot /usr/local/bin/startup_task.sh

@yearly /usr/local/bin/yearly_cleanup.sh
@annually /usr/local/bin/yearly_cleanup.sh

@monthly /usr/local/bin/monthly_report.sh

@weekly /usr/local/bin/weekly_backup.sh

@daily /usr/local/bin/daily_sync.sh
@midnight /usr/local/bin/daily_sync.sh

@hourly /usr/local/bin/hourly_healthcheck.sh
```