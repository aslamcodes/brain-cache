---
tags:
type:
date: 2026-01-01
done: false
---
# Philosophy
Everything in systemd is a unit; **Unit files** - defined in `ini` files, located under `/etc/systemd/system/*.service` - describes *units* behave.

# Unit File
- **\[Unit]** → description + dependencies
- **\[Type\] section** (e.g. `[Service]`) → how it runs
- **\[Install\]** → enable/disable wiring, ie defines **how a unit is enabled**, when `systemctl enable sample.service` is invoked
## Unit Types
- `service` → start/stop a process
- `socket` → listen on a socket, start service on demand
- `timer` → schedule work (cron replacement)
- `mount` → mount filesystems
- `target` → grouping + synchronization

## Install
- `WantedBy=` → where this unit is hooked eg [[SysV vs Systemd|systemd]]'s targets
- `RequiredBy=` → hard dependency
- `Alias=` → alternate unit name
- `Also=` → enable/disable extra units together
# Sample configuration file
```ini
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Environment="JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.362.b09-4.el9.x86_64"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"
ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
```