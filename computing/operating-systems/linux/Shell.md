---
tags:
type:
date: 2025-11-28
done: false
---
# Definitions
A Shell is a computer program often represent itself as a computer program via GUI or CLI that provides you with a **interface** between the user and the OS.

- **CLI shells** (bash, zsh, PowerShell) → ***thin***. They parse input and launch programs.
- **GUI shells** (GNOME Shell, Windows Explorer) → ***thicker***. They manage windows, panels, compositors, widgets.

> [!NOTE] Interactive vs Non-interactive shell
> **Interactive:** As the term implies: Interactive means that the commands are run with user-interaction from keyboard. E.g. the shell can prompt the user to enter input.
> 
> **Non-interactive:** the shell is probably run from an automated process so it can't assume, it can request input or that someone will see the output. E.g., maybe it is best to write output to a log file.

> [!NOTE] Login vs Non Login shells
> **Login:** Means that the shell is run as part of the login of the user to the system. Typically used to do any configuration that a user needs/wants to establish his work environment.
> 
> **Non-login:** Any other shell run by the user after logging on, or which is run by any automated process which is not coupled to a logged in user.

GNOME Shell, Windows, OSx are graphical shells that is configured to start when I boot the system, so it makes it a login shell. 

# Viewing file sizes
The du command display the file size or "disk usage" of the given argument
```sh
du -sh file
```
`s - each entry for specified file, if not each file in the directory or printed`
`h - human readable`

The same can be achieved via long list `ll -lh`
# Archiving Files with  Tape Archive
Create a tar ball 
```sh
tar -cf test.tar file1 file2
```

Create a tar ball with gzip
```sh
tar -zcf test.tar file1 file2
```

List the files in a tarball (or --list)
```sh
tar -tf test.tar
```

# Compressing files
`gzip`, `bzip2`, `xz` - Popular compression utilities
`gunzip`, `bunzip2`, `unxz` - Un -zip them
`zcat`, `bzcat`, `xzcat` - Read without uncompressing

# Searching files and directories
Find the files with name city.txt
`locate city.txt`

search within a file (os.stdint, pipe, regular files)
`grep -r` to search within a directory recursively

`grep -w` to search a word

# Redirect IO
redirect stdin `>` or `1>`
redirect stderr `2>`
redirect stdout `3>`