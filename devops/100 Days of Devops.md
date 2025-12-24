---
tags:
type:
date: 2025-12-10
done: false
---
# Day 1 : Linux user creation
The task is to create a user on server with non-interactive shell
`sudo useradd -c "created for backup agent -s /sbin/nologin ravi`
This command creates a user named `ravi` with the login shell as `/sbin/nologin`, or sometimes with `/bin/false`
[[users and groups]]
# Day 2 : Linux user creation with expiry
The task is to create a user with temporary access until the completion of the project, the -e attribute can be used to achieve this

```sh
useradd -e 2024-03-28 john
```
[[users and groups]]
# Day 3: Preventing SSH root login access
Disabling SSH root login should be handled on SSH level or the user level?

The sshd deamon has as config file, where we can set `PermitRootLogin no` to prevent logging in as user, the config file is located at `/etc/ssh/sshd_config`

**What is password locking in linux?**
doing `passwd -l <user>` adds a `!` before user password, this invalidates the password hash, hence the user won’t be able to login after. This can be used to prevent root login over ssh, but its not auditable and not really sound, as you can login with password-less mechanisms.
## Day 4: Executable permissions
The task simply required to update the permissions of a given file. 

>  Your task is to grant executable permissions to the /tmp/xfusioncorp.sh script on App Server 3. Additionally, ensure that all users have the capability to execute it.

However the `chmod +x`, which is meant to make the file executable didn't work. However `chmod 755` worked. This is possible a misleading task description
[[Permissions]]
# Day 5: Installing SE Linux
## Understanding SELinux
See kernel modules at [[Linux Kernel]]
### DAC vs MAC
Linux uses DAC ([Discretionary](https://www.merriam-webster.com/dictionary/discretion) Access control) by default, that is the file owner is being discretionary upon providing access. SELinux however, provides MAC (Mandatory Access Control) where the access is controlled centrally, users and owners is not permitted to change those since the decisions are enforced with Linux kernel.

The weakness of DAC is being, that the owner is given the control, and the big assumption that the user regulates the access securely. The access to files are governed by a central policy (more like [[SCP|AWS's SCP]]), so that any compromised process is not going to get most out of the affected system.  MAC is for government systems, containers where the blast radius have to be reduced and governance should be strict.

DAC and MAC works together, SELinux just adds to the access verification.
### Enabling SELinux
installing policycoreutils provides `setenforce` and `getenforce` commands. SELinux can be enabled by modifying `~/etc/selinux/config`. Heres a sample config file. 

```sh
sudo yum install policycoreutils selinux-policy selinux-policy-targeted policycoreutils-python-utils
```

```ini
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
# enforcing - SELinux security policy is enforced.
# permissive - SELinux prints warnings instead of enforcing.
# disabled - No SELinux policy is loaded.
SELINUX=enforcing
# SELINUXTYPE= can take one of these two values:
# default - equivalent to the old strict and targeted policies
# mls     - Multi-Level Security (for military and educational use)
# src     - Custom policy built from source
SELINUXTYPE=default

# SETLOCALDEFS= Check local definition changes
SETLOCALDEFS=0
```
> Once the SELINUX variable set to `enforcing`, we would need to reboot the system, as this is a kernel module, that needs to loaded

https://www.geeksforgeeks.org/linux-unix/what-is-selinux/S3 