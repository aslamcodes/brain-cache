---
tags:
type:
date: 2025-12-23
done: false
---
### 1. By source
- **In-tree modules**  
    Part of mainline Linux kernel.
- **Out-of-tree modules**  
    Built separately (vendor / third-party).
### 2. By license
 - **GPL-compatible**  
- **Proprietary**  
### 3. By functionality
- **Device drivers** (GPU, NIC, storage)
- **Filesystem modules** (ext4, xfs)
- **Network stack modules** (netfilter, bridges)
- **Crypto modules**
- **Virtualization modules** (kvm, vbox)
 ### 4. By load model
 - **Built-in (`=y`)**  
- **Loadable (`=m`)**   The .ko files that are controlled on runtime
### 5. By maintenance model
- **Upstream-maintained**
- **Vendor-maintained**
- **Community-maintained (external)**

These are the standard mental buckets used by kernel devs and distros.