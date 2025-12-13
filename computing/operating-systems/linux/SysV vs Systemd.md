---
tags:
type:
date: 2025-11-29
done: false
---
![[SysV vs Systemd-1764434220533.png]]
The init systems - being the last part of the boot sequence - are responsible for setting up the user space programs. 

SysV (System 5) - is a init system used before systemd. 

SysV had runlevels - 0 - 6. These run-levels specify what should be course of actions that the SysV should do. 

runlevel 5 sets up the Graphical system
runlevel 3 sets up the multi-user system
runlevel 0 is poweroff

The command run-level gives what the level the currently set up

The advantage of using systemd is, systemd reduces the boot time, leveraging parallelism, and runlevels are replaced by `systemd targets`

To identify which init system is being used
```sh
ls -l /sbin/init
```

The command `systemd get-default` gives you the default systemd target. 

The default systemd target is a [[symlink]] to targets present in `/lib/systemd/system/*.target`

the default target can be changed to `systemd set-default`

it is possible to set the default systemd target to poweroff. Doing so will shut down your system as you boot it. Recovery is to get into rescue mode using external media