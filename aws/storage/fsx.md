# FSx
- Managed File system for third party filesystems, Liks RDS
    - FSx Lustre
    - FSx Windows file server
    - FSx OpenZFS
    - FSx NetApp Ontab

## FSx for Windows File server
- Supports SMB protocol, and Windows NTFS
- Integration with AD
- Can also be mounted in ec2 instances
- Scale up to 10s of gbps, millions of IOPS and 100s pb of data
- Supports Microsoft's DFS, group files across mulitple FS
- Data backed up to s3 daily

## FSx Lustre
- Used for large scale computing
- Lustre = Linux + Cluster
- Machine Learning, HPC
- Storage 
    - ssd - Low latency IOPS intensive
    - hdd - Thoroughput
- Integrated with s3, read through adn write to s3 

Both can be accessed from on prem, s2s, dc

## Fsx for NetApp onTap
- Compatible with NFS, SMB, iSCSI protocol
- move from NAS, Ontap to AWS
- Windows, linux, MacOS, worksapces & appstream, VMWare cloud on AWS, Ec2, eks and ecs
- Shirk or grow automatically
**Point it time cloning, for testing workloads**

## FSx for OpenZFS
- Managed openZFS
- Only with NFS
- Move workloads to AWS 
- Compatible, linux mac windows

## FSx for Sysops
Single AZ vs Multi AZ
