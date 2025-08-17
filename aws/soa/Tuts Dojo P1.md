---
tags: 
type: 
date: 2025-07-25
done: false
---
[https://tutorialsdojo.com/aws-identity-and-access-management-iam/](https://tutorialsdojo.com/aws-identity-and-access-management-iam/)
[https://tutorialsdojo.com/service-control-policies-scp-vs-iam-policies/](https://tutorialsdojo.com/service-control-policies-scp-vs-iam-policies/)
[https://tutorialsdojo.com/comparison-of-aws-services/](https://tutorialsdojo.com/comparison-of-aws-services/)

- You can customise your URL of sign in, and you CANNOT use single URL for multiple accounts even if the accounts are under Organization
	![[Tuts Dojo P1-1753451693035.png]]
- Only the bucket owner can setup/suspend MFA, but an IAM administrator can suspend versioning alone
- It is recommended to stop ELB access log delivery to s3 before deleting it.
- aws s3 rb --force only works if versioning is disabled
- There is option to enable default encryption of **newly** created EBS volumes, but config is reactive in nature
- To pass a role (and its permissions) to an AWS service, a user must have permissions to _pass the role_ to the service. iam:passrole, iam:getrole to get the details of role to be passed
- Bucket policy vs Object ACLs. 
	- ACL - Object writers owns the authority of access of objects
	- Enabling ACL disabled **[Bucket owner enforced](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html)**
	- ACLs - Bucket owner prefered and Object writer[[]()]()
- [[IAM Access Analyser]]
- [[kms - key rotation]]
- NLB won't support path based or host based routing as it primarily functions on layer 4, but supports web sockets. But ALBs support host and path routing, websockets support
- AWS backups not reboots instances, 
	- AWS Backup backs up EC2 instances by snapshotting their EBS volumes (root + attached).
	- It also stores instance configuration (like instance type, VPC, security groups), when its done for EC2
	- On restore, AWS Backup **recreates** a new EC2 instance using those snapshots and config.
	- But:
		It does not create an AMI.
		You won’t see an AMI in your EC2 console.
		It’s not reusable like an AMI for launching multiple instances.
- To put ELB logs into bucket, the bucket and elb should be in the same region
- Unhealthy targets in weighted routing policy will not get traffic automatically
- Elasticached Memcached not support Multi AZ for HA
- If you want just outbound access via IPv6 or ipv6's NAT -> EGIGW which is for private subnets, you'll need to have Egress-Only internet gateway, but if you want
-  Go to Billing Preferences in the management account and disable RI discount sharing. Then, purchase the RIs using individual member accounts.
- If there's a REJECT in vpc flow logs, its either sg or nacl issue. if inbound is allowed, but not the outbound, its the nacl issue
- RDS does not support Oracle RAC
- ![[health-checks]]
- EC2 Recovery is an **automated recovery** feature for EC2 instances using **CloudWatch alarms**. It restarts the instance on different hardware **without changing**You **enable** it by setting a **CloudWatch alarm** for status checks (e.g., `StatusCheckFailed_System`) and **set recovery as the action**.
- You cannot change the iops of an EFS system, you'd need to create a new efs and migrate data to it
- ![[EFS]] 
- ![[fsx]]
- procstat pluging![[Tuts Dojo P1-1753469070725.png]]
- 