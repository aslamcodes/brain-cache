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
See kernel modules at [[Linux Kernel]]

**What's SELinux**
SELinux (Security Enhanced Linux) is a linux kernel module, that enforces strict policies on Access Control

https://www.geeksforgeeks.org/linux-unix/what-is-selinux/S3 
