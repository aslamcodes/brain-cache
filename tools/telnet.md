---
tags:
type:
date: 2026-01-01
done: false
---
Simple TCP client to test connectivity

**Read more**
```sh
man telnet
```
**Common usages**
```sh
telnet host port
```
**Typical uses**:
- `telnet host 22` → SSH port reachable?
- `telnet db 3306` → DB port reachable?
- `telnet app 8080` → service listening?
**Failure patterns**:
- `Connection refused` → service not running / wrong port
- `Connection timed out` → firewall / routing issue
- Hangs then closes → proxy / LB issue	