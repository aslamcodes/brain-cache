---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
- High performance hardware disk, better I/O performance
- Special type of Ec2 instance, 'i' instance family?
- Backups and Restoration are our RESPONSIBLITY
- Ephemeral, only for ephemeral IO operations, buffer, cache, temporary content

Reboot and Hibernate will not affect the data. Since its a hot reboot. Cold reboot replaces the instances
## Taking AMI for instance stored instances 
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-instance-store.html
- The AMI is just the EC2 configuration and the root OS
## Resizing an Instance
- When you stop an instance, the data on any instance store volumes is erased. To keep data from instance store volumes, be sure to back it up to persistent storage.
