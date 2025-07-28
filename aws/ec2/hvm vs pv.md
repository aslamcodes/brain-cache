---
dg-publish: true
tags:
  - review
type: 
date: 19th July 2025
done: false
---

| Feature             | HVM (Hardware Virtual Machine)    | PV (Paravirtual)            |
| ------------------- | --------------------------------- | --------------------------- |
| Virtualization Type | Full (hardware-assisted)          | Partial (software-assisted) |
| Performance         | Better (near-native)              | Slower                      |
| Instance Support    | Required for modern (e.g., Nitro) | Legacy only                 |
| Boot Options        | EBS or Instance Store             | EBS only                    |
| Enhanced Networking | Supported                         | Not supported               |
| GPU Support         | Supported                         | Not supported               |
| Status              | Recommended / Default             | Deprecated                  |

PV (Paravirtualization): PV guests boot using a special bootloader called PV-GRUB. Instead of booting the actual hardware BIOS or MBR, the PV instance loads a bootloader that then chain loads the kernel specified in the image's menu.lst file. The guest OS must be modified or aware that it is running in a virtualized environment to communicate directly with the hypervisor. This requires a paravirtualized kernel that cooperates closely with the host system.

HVM (Hardware Virtual Machine): HVM instances boot by executing the master boot record (MBR) of the root block device just like a physical machine. The system presents a fully virtualized hardware environment to the guest OS that does not require modification. This allows the guest OS to boot natively, as if running on bare-metal hardware, through a typical bootloader (like GRUB or GRUB2). HVM uses hardware virtualization extensions in CPUs enabling direct access to specialized hardware, supporting enhanced features like GPU and enhanced networking
