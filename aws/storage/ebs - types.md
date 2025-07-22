---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
1. gp2/gp3 (boot) - General Purpose SSD balanced
2. io1/io2 (boot) - High performant SSD, low latent, high throughput
3. stl - HDD
4. scl - lowest cost HDD

# General Purpose
## gp3
- Lets you to scale volume performance (iops, througput) independently of volume size.
- 20% lower in price compared to gp2
- guarantess single digit milisecond latency???
- up to 16,000 IOPS and 1,000 MiB/s throughput
## gp2
- performance scales with storage
## what is the blocking factor that aws solved from gp2 to gp3?
AWS designed gp2 assuming that **larger volumes usually need more IOPS**, which is **often true for general workloads**, but not always.
### Why it's not universally valid:
- Some workloads (e.g., databases, logs) need **high IOPS on small volumes**.
- Tying IOPS to size penalizes performance-heavy but storage-light use cases.

It wasn’t a bad assumption for the general case, but it **didn’t fit many real-world patterns**, which is why **gp3 decoupled** them.
# PIOPS - Provisioned IOPS SSD Volumes
- They are the highest performance Amazon EBS storage volumes designed for critical, IOPS-intensive, and throughput-intensive workloads that require low latency.
## io2
- `io2` volumes are built on the next generation of Amazon EBS storage server architecture
- [Nitro-based instances](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-nitro-instances.html) support volumes provisioned with up to 256,000 IOPS. Other instance types can be attached to volumes provisioned with up to 64,000 IOPS, but can achieve up to 32,000 IOPS.
- Volumes with greater than 32000 IOPS must be attached to a Nitro based instance to achieve provisioned performance
## io1
- designed for high IO intensive workloads, such as databases
-  100 IOPS up to 64,000 IOPS
- maximum ratio of provisioned IOPS to requested volume size (in GiB) is 50:1
- for 100 GB its 5000 IOPS. Ie the maximum is 50 IOPS for 1 GB
- But maximum iops is 64000 for 1280GB or larger
# Modifying volume 
- After modifying a volume, you must wait at least **six hours** and ensure that the volume is in the `in-use` or `available` state before you can modify the same volume.
- Modifying an EBS volume can take from a few minutes to a few hours, depending on the configuration changes being applied.
- An EBS volume that is 1 TiB in size can typically take up to six hours to be modified.
- However, the same volume could take 24 hours or longer in other situations.

- A root volume of type `io1`, `io2`, `gp2`, `gp3`, or `standard` can't be modified to an `st1` or `sc1` volume, even if it is detached from the instance.