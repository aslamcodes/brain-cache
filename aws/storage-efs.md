# Storage Classes
- EFS Standard: High performance 
- EFS IA: Cost Optimised
- EFS Archive: Archive

# Performance Modes
- General Purpose or Max I/O

# Throughput Modes
- Elastic, Provisioned, Bursting

Bursting: 50MiB/s + Burst Credits upto 100MiB/s
Provisioned: Set your Throughput, upto 
Elastic: Automatically Scales based on workloads

# File System Type
- Regional or One Zone
Standard is Regional, One zone is for pocs and test cases e

https://docs.aws.amazon.com/efs/latest/ug/performance.html#performance-overview

# Lifecycle Management
- EFS has intelligent lifecycle policy which we can use to enforce 

# Operations
- Some can be done in place, some requires full migrations 🚨

Lifecycle Policy, Throughput, access points, and PIOPS can be changed in place

Requires migration
- Change encryption key
- Enable performance Mode Max IO
