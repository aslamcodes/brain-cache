IO: Read or Write, IOPS; IO per second
Throughput: Megabytes per second, IOPS -> Number of operations per second

# EC2 Storage
## EBS
- Network attached storage, without the OS knowing
- Persists data even if you want, after termination. And The same ec2 can be recreated
- EBS volumes are bound to AZ, hardware scoped
- "network USB stick", detach/attach
- EBS can be left unattached

-> Delete on termination, default for root volume. Other is disabled
-> Since network is used, there might be a bit of latency
-> Use EBS snapshots if you want to move across AZ

### Types of EBS volume
1. gp2/gp3 (boot) - General Purpose
2. io1/io2 (boot) - High performant SSD, low latent, high throughput
3. stl - HDD
4. scl - lowest cost HDD

### Volume Resizing
[[volume-resizing]]

Only can increased, new size will be not partitioned
To be decreased, need to migrate to smaller EBS volume

### EBS Snapshots
- Point in time Backup for EBS Volumes
- Recommened to shut off instance, before snapshotting
- Can be copied to AZ, and can be restored

-> EBS snapshots are internally stored in amazon s3
-> FSR (expensive): Since EBS are stored at s3, intilisation happens progressively. dd or fio commands can be used or FSR can be used

- Move snapshot to archive tier, to save 70% of costs, takes 22 to 72 hours
- Retention period can be setup for accidental deletion

> EBS Snapshots can be automated with Amazon Data Lifecycle Manager, AWS backups is recent and more general service

### EBS Migration
- EBS volumes are AZ scoped, as it is hardware scoped
- To migrate a volume in another AZ
    1. Take a snapshot
    2. Create EBS out of snapshot (since snapshots are stored in s3)

### Multi Attach iO1 OR io2
- Up to 16 instances
- Due to the fact, that io2, io1 are high IOPS, which can be shared with multiple instances
- Must use a cluster awar filesystem


## EC2 Instance store
- High performance hardware disk, better I/O performance
- Special type of Ec2 instance, 'i' instance family?

-> Backups and Restoration are our RESPONSIBLITY
-> Ephemeral, only for ephemeral IO operations, buffer, cache, temporary content


