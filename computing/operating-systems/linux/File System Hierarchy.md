---
tags:
type:
date: 2025-11-29
done: false
---
# What is a file system?
> A file system is a OS program - that facilitates file organization and access. The storage devices have no idea of what a file is. 

The storage device is all about storing the bits. I think the file system is what that gives the context to the files. Or the files system has the criteria of identifying what's a file or what qualifies to be a file in a storage device.

File systems are part of OS that manages the file organization and access. The file system can be understood as layers of abstraction over the data. The *logical filesystem* has to provide api for applications for operations like *open, close, read, write*. The *physical filesystem* has to deal with the representation of files in the storage devices, however actual implementation might not differentiate the process operations

# File system hierarchy in linux
/ — root of everything
/bin — essential system commands
/sbin — essential system admin commands
/usr/bin — most user commands
/usr/lib — libraries
/lib — core libraries
/etc — config files
/var — logs, caches, spool
/home — user homes
/root — root user home
/tmp — temp files
/boot — kernel + bootloader stuff
/dev — device files
/proc — virtual info about processes
/sys — virtual info about hardware
/mnt, /media — mount points
