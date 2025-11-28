---
tags:
type:
date: 2025-09-23
done: false
---
Sole reason that users exists are for access and permission, if any user would be able to bypass the OS into actual hardware the data could be accessed, encrypting the data would be ideal

**UID** for users, **GID** for groups

users not necessarily mean actual Humans, it could be
- **Human users** → login via shell/GUI.
- **System users** → service/daemon accounts (e.g., `nginx`, `mysql`). 
- **Root** → superuser, UID `0`.
- **Pseudo-users** → special UIDs for kernel/system tasks (e.g., `nobody`).

## Root
- This user has access to all the files within the system
- Dangerous to work as root all the time
- That's why superuser do or sudo is there.
- The **su** command stands for substitute user, if nothing specified it defaults to root
	- Downside being, you un all the commands as root, potential danger

- There is a file called the `/etc/sudoers` file; this file lists users who can run `sudo`, and can be edited with visudo

# /etc/passwd and shadow

passwd - This file contains the details about the users in the system
x denotes that passord is stored in shadow file
```bash
aslamcodes:x:1000:1000:Mohamed Aslam:/home/aslamcodes:/bin/bash
```
shadow file 
The password is encrypted and The numbers are related to expiry and creation date details
```
root:MyEPTEa$6Nonsense:15000:0:99999:7:::
```
`passwd` to change password
# User management tools
`useradd` `userdell` 