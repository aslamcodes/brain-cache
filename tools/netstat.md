---
tags:
type:
date: 2026-01-01
done: false
---
> **netstat** is a command-line network utility that shows network connections, listening ports, routing tables, and socket stats

- Check which ports are listening on a host
- Find what process is using a port
- Debug service not reachable / connection issues
- Inspect established TCP connections
- Verify firewall or service startup behavior
- Quick incident triage on legacy systems
 
 - **List all listening ports**
     `netstat -tuln`
- **Show listening ports with process name (root)**
     `sudo netstat -tulnp`
- **View all active connections**
    `netstat -an`
- **Check TCP connections only**
    `netstat -ant`
- **Find which service is using a port**
     `netstat -tulnp | grep :8080`
- **Display routing table**
     `netstat -rn`
- **Show network interface statistics**
     `netstat -i`