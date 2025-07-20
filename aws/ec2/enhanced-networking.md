---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---


EFA - Improved ENA, for linux only. Bypasses the linux OS for low latency. 🤷

> if your CPU is not powerful enough, it can directly limit your network performance

Uses single root I/O virtualization to provided high performance networking in select instances and lower cpu utilization.
# ENA - Higher PPS, and bandwidth
ENA supports up-to 10gbps
All nitro based instances uses ENA for enhanced networking
These Xen based instances uses ENA: H1, I3, G3, `m4.16xlarge`, P2, P3, P3dn, and R4

Consider using enhanced networking for the following scenarios
- If your packets-per-second rate reaches its ceiling, consider moving to enhanced networking. If your rate reaches its ceiling, you've likely reached the upper thresholds of the virtual network interface driver.
- If your throughput is near or exceeding 20K packets per second (PPS) on the VIF driver, it's a best practice to use enhanced networking.

- **Up to 25 Gbps:** Use **ENA-compatible instances** in a **cluster placement group**.
- **Up to 10 Gbps:** Use **enhanced networking instances** in a **cluster placement group**.
	- **ENA-compatible instances** use **ENA**, which supports speeds **up to 100 Gbps**.
	- **Enhanced networking** can also mean **Intel VF (Virtio)**, which supports **up to 10 Gbps**.