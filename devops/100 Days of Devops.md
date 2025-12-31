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

# Day 6: CRON
[[CRON]]
The task is about setting up crontab, that automates a particular task by executing scripts
# Day 7: Password less - jump host
xFusion wants to automate some script execution from the jump host itself, for this, its required to setup a password-less ssh access to the appservers from the jumphosts to the respecitive sudo users (ie Tony)

[[ssh]]

This can be achieved via public key cryptography. The keys can be created with ssh-keygen and copied over with ssh-copy-id
```sh
ssh-keygen
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@host
```

# Day 8 : Setting Up Ansible controller
The task is to install ansible on the jump host, which is going to serve as a temporary ansible controller. Wherever you install ansible binary, it technically can be a ansible controller. almost everything lives on the control node. Targets are mostly passive, accessed via ssh.

**Key components in a ansible setup**
- **Control node** – machine where Ansible runs
- **Managed nodes** – target hosts
- **Inventory** – list of hosts/groups
- **Modules** – units of work (copy, yum, service, etc.)
- **Playbooks** – YAML automation definitions
- **Plays** – map tasks to hosts
- **Tasks** – single actions
- **Roles** – reusable playbook structure
- **Facts** – system info from nodes
- **Variables** – dynamic values
- **Plugins** – extend behavior (connection, lookup, callback)
- **Collections** – packaged roles, modules, plugins

Ansible knows its target via its inventory configuration; that can be static (ie from static files) and can be dynamic, such as from an API.
```ini
[web]
10.0.0.12
```

# Day 9: Troubleshooting MariaDb
- MariaDB was **inactive** because it failed to start.
- systemd logs were generic; real error was in MariaDB output.
- Root cause:
    `Permission denied: /run/mariadb/mariadb.pid`
- `/run/mariadb` existed but was owned by `root:mysql`.
- MariaDB runs as `mysql`, so it couldn’t write the PID file.
- Fix:
    `chown mysql:mysql /run/mariadb systemctl restart mariadb`
- After this, MariaDB should run normally.

[[ownership in linux]]

# Day 10: Automation Scripts
The task is to setup a backup scripts on the tony's appserver, which is meant to create the backup of contents at `/var/www/html/beta` into the `/backup` directory. And the script is also meant to copy the backup contents over the backup server without any password prompts, which can be achieved via [[100 Days of Devops#Day 7 Password less - jump host|Day 7's Password Less authentication challenge]] 
```sh
#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="/var/www/html/beta"
BACKUP_DIR="/backup"
ARCHIVE="xfusioncorp_beta_$(date +%F_%H%M%S).zip"
REMOTE="clint@stbkp01.stratos.xfusioncorp.com:/backup"

# create archive
zip -r "${BACKUP_DIR}/${ARCHIVE}" "${SRC_DIR}"

# verify archive
test -s "${BACKUP_DIR}/${ARCHIVE}"

# transfer
scp "${BACKUP_DIR}/${ARCHIVE}" "${REMOTE}"

```
# Day 11: Tomcat setup
 
> **Apache HTTPD** → for static sites; **Tomcat** → for Java web apps

The task is to create a tomcat server in one of the appserver, that will serve a ROOT.war file provided to us. 

Here's a brute-force approach, but there is better ways to do this leveraging systemd service, and proper linux user management. 

```
sudo yum install -y java-17-openjdk unzip wget

cd /opt

// Install the latest tomcat server
sudo wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.15/bin/apache-tomcat-11.0.15.zip

sudo unzip apache-tomcat-11.0.15.zip

sudo mv apache-tomcat-11.0.15 tomcat

sudo rm -f apache-tomcat-11.0.15.zip

sudo chmod +x /opt/tomcat/bin/*.sh

// edit the connector port to 5003
vi /opt/tomcat/conf/server.xml

// create a tomcat user that's responisble for running the tomcat server
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat

sudo chown -R tomcat:tomcat /opt/tomcat

// remove existing /opt/tomcat/webpages/ROOT and place the ROOT.war, with appropriate permssion

rm /opt/tomcat/webpages/ROOT
cp /tmp/ROOT.war /opt/tomcat/webpages

sudo -u tomcat /opt/tomcat/bin/startup.sh
```
**Optimised Approach**