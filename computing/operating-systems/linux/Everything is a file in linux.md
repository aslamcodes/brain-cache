---
tags:
type:
date: 2025-11-29
done: false
---
	Regular Files
- Common type of files
- Code, shell scripts, images
Directory Files
- /home, /root
Special Files
- Character Files 
	- Devices under /dev directory
	- This allows the OS to communicate with IO devices serially
	- Example includes devices like mouse and keyboard
- Block Files
	- located under /dev
	- Reads from and writes to hardware devices in blocks (chunks of data)
	- Harddisks and Ram
- Links
	- Hard links
		- Two or more files that share the same block of data in the disk
		- Deleting the last link will delete the data
	- Symbolic links (soft links)
		- Act as pointers to another file 
		- Deleting a sym link will not delete the data
- Socket
	- Enables the communication between two processes
- Named Pipes
	- Special type of file that allows connecting one process as input to other
	- The data flow is unidirectional

`file` command identifies the type of given file

`ls -al` The first character will denote the type of file

d directory
\-  regular file
c character device
l link
s socket
p pipe
b block device
