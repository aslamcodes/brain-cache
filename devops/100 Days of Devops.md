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
- [[Kernel Modules]]
- [[DAC and MAC]]
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

# Day 6:
	[[CRON]]


# Day 7: Password less - jump host
xFusion wants to automate some script execution from the jump host itself, for this, its required to setup a password-less ssh access to the appservers from the jumphosts to the respecitive sudo users (ie Tony)

[[ssh]]

This can be achieved via public key cryptography. The keys can be created with ssh-keygen and copied over with ssh-copy-id
```sh
ssh-keygen
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@host
```
 