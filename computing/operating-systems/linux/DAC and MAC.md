---
tags:
type:
date: 2025-12-25
done: false
---
Linux uses DAC ([Discretionary](https://www.merriam-webster.com/dictionary/discretion) Access control) by default, that is the file owner is being discretionary upon providing access. SELinux however, provides MAC (Mandatory Access Control) where the access is controlled centrally, users and owners is not permitted to change those since the decisions are enforced with Linux kernel.

The weakness of DAC is being, that the owner is given the control, and the big assumption that the user regulates the access securely. The access to files are governed by a central policy (more like [[SCP|AWS's SCP]]), so that any compromised process is not going to get most out of the affected system.  MAC is for government systems, containers where the blast radius have to be reduced and governance should be strict.

DAC and MAC works together, SELinux just adds to the access verification.