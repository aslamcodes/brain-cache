---
tags:
type:
date: 2025-12-02
done: false
---
`/etc/hosts` - The file responsible for resolving the host from the client-side or file-based resolution

Since this is not scalable, an external dns server can be configured.

`/etc/resolv.conf` - The file responsible for managing external dns entries

```
$ cat /etc/resolv.conf 
	search caleston.ca
	nameserver 8.8.8.8
	options ndots:5
```

The order of dns resolution can be configured at `/etc/nsswitch.conf`

```
$ cat /etc/nsswitch.conf
	# /etc/nsswitch.conf
	#
	# Example configuration of GNU Name Service Switch functionality.
	# If you have the `glibc-doc-reference' and `info' packages installed, try:
	# `info libc "Name Service Switch"' for information about this file.
	
	passwd:         compat systemd
	group:          compat systemd
	shadow:         compat
	gshadow:        files
	
	hosts:          files dns
	networks:       files
	
	protocols:      db files
	services:       db files
	ethers:         db files
	rpc:            db files
	
	netgroup:       nis
```