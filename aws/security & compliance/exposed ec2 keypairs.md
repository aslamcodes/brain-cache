---
tags:
type:
date: 2025-09-24
done: false
---
![[exposed ec2 keypairs-1758690359554.jpeg]]

**Notes**
- The private key is deleted as you downloaded it, there is no way of recovering the key 
- Deleting a key pair from AWS won't delete in instances that are created with it, its just you won't be able to create new instances with it
- If an **AMI** is created with a key pair, but if you try to launch with a new ami, you would have two key pairs at `~/.ssh/authorized_keys`

# Compromised Key pairs
- Use **SSM Run Command** to remove the existing key pairs within the instances and add the new public key
![[exposed ec2 keypairs-1758690621471.jpeg]]
- Use **EC2 Serial Port** to manually edit the key files
- **EBS Volume Swap** - Create a new instance with a new ec2 instances, attach the EBS root volume to it