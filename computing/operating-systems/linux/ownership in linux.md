---
tags:
type:
date: 2025-12-28
done: false
---
## Basic Ownership Structure
Every file and directory has two types of owners:
- **User (owner)**: The individual user who owns the file
- **Group**: A group of users who share access to the file
## Viewing Ownership
You can see file ownership using `ls -l`:
```
-rw-r--r-- 1 john developers 1234 Dec 28 10:30 myfile.txt
```
In this example, `john` is the user owner and `developers` is the group owner.
## Changing Ownership
**chown** - Changes user and/or group ownership:
```bash
# Change user owner
sudo chown newuser file.txt

# Change user and group
sudo chown newuser:newgroup file.txt

# Change only group
sudo chown :newgroup file.txt

# Recursive (for directories)
sudo chown -R newuser:newgroup /path/to/directory
```

**chgrp** - Changes only group ownership:
```bash
chgrp newgroup file.txt
```
## Who Can Change Ownership
**Changing User Ownership:**
- Only root (or sudo) can change a file's user owner to a different user
- This prevents security issues and maintains clear accountability
**Changing Group Ownership:**
- Root can change any file's group to any group
- File owners can change the group, but only to groups they are members of
- You do not need to be in the source (current) group
- You only need to own the file and be a member of the target (new) group

**Example:**

```bash
# alice owns myfile.txt (current group: developers)
# alice is a member of: marketing, sales
# alice is NOT a member of: developers

chgrp marketing myfile.txt  # Works - alice owns file and is in marketing
chgrp engineering myfile.txt  # Fails - alice is not in engineering
```
## Important Notes
- When a file is created, it's typically owned by the user who created it and assigned to that user's primary group
- Ownership works together with permissions (read, write, execute) to control file access
- The root user (UID 0) can access any file regardless of ownership
- Non-owners cannot change a file's group, even if they're in both the source and target groups
# Related Documents
[[DAC and MAC]]
[[Everything is a file in linux]]
[[selinux]]