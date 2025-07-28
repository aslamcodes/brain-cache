---
tags: 
type: 
date: 2025-07-26
done: false
---
s3 transfer acceleartion 
Blocking unwanted IPs from NACL or SG Level
Full mesh means connecting all vpcs together
You cannot terminate resources using aws billing alarms
aurora db.serverless class

- If you have millions of s3 object version, it might result in 5xx errors, [[s3 Transfer accelerator and Global Accelerator]] would not work here as it is just for speeding up the transfer. it won't help for internal throttling
- You can have a lifecycle policy to pause instance termination
- [[rds - proxy]]
- Aurora backtracking, undoes mistakes, PITR restores a new database
- Much liks EBS, you can't encrypt a EFS in place
- ASG is a regional resource
- You can use [[service-catalog]] to enforce tags when creating resources
- The following are a few reasons why your EC2 instance goes from the `pending` state to the `terminated` state immediately after restarting it:
	- You've reached your EBS volume limit.
	- An EBS snapshot is corrupt.
	- The root EBS volume is encrypted and you do not have permission to access the KMS key for decryption.
	- The instance store-backed AMI that you used to launch the instance is missing a required part (an image.part.xx file).
- Elasticache Online resizing Redis - you can scale your Redis clusters dynamically with minimal downtime. This allows your Redis cluster to serve requests even while scaling.
- volume gateway 
	- stored volumes
	- cached volumes
- `instance profile associated with the environment does not exist` - the role used to launch the environment does not have permission to create roles.
- Bucket policy
	- "Resource": "arn:aws:s3:::tutorialsdojo" - `Action does not apply to any resource(s) in statement`
	- "Resource": "arn:aws:s3:::tutorialsdojo" and "Resource": "arn:aws:s3:::tutorialsdojo/*" - `Action does not apply to any resource(s) in statement`
- When using server-side encryption with customer-provided encryption keys (SSE-C), you must provide encryption key information using the following request headers:
	1. `x-amz-server-side​-encryption​-customer-algorithm`
	2. `x-amz-server-side​-encryption​-customer-key`
	3. `x-amz-server-side​-encryption​-customer-key-MD5`
- S3 ACLs
	- `READ`
	-  `READ` and `READ_ACP`
	-  `WRITE` and `WRITE_ACP`
	-  `FULL_CONTROL`
- If the eviction count has exceeded the chosen threshold, you need to scale the cluster up using a larger node type or scale out by adding more nodes to accommodate the additional data

	- **Cluster** – packs instances close together inside an Availability Zone. This strategy enables workloads to achieve the low-latency network performance necessary for tightly-coupled node-to-node communication that is typical of HPC applications.
	- **Partition** – spreads your instances across logical partitions such that groups of instances in one partition do not share the underlying hardware with groups of instances in different partitions. This strategy is typically used by large distributed and replicated workloads, such as Hadoop, Cassandra, and Kafka.
	- **Spread –** strictly places a small group of instances across distinct underlying hardware to reduce correlated failures.

- reduce latency by routing user’s requests to the endpoint closest to them, requires static IP addresses - AWS global accelerator
- MTU
- ipv6 to connect to the internet
	- Associate a /56 IPv6 CIDR block with the VPC. The size of the IPv6 CIDR block is fixed (/56) and the range of IPv6 addresses is automatically allocated from Amazon's pool of IPv6 addresses (you cannot select the range yourself).
	- Create a subnet with a /64 IPv6 CIDR block in your VPC. The size of the IPv6 CIDR block is fixed (/64).
	- Create a custom route table, and associates it with your subnet, so that traffic can flow between the subnet and the Internet gateway.
- SG don't deny
- It might be a network issue, when some can reach and some cannot reach instances, as the instances might not be reachable given that you have provisioned enough 

