---
tags: 
type: 
date: 2025-07-26
done: false
---
To improve loading times on ALB
- Setup cloudfront distribution
- NLB might help improve the solution, but won't be scalable across the globe

Limiting access only around organisation, you can't directly specify an principal, ![[principal inputs]]
![[Tuts Dojo P3-1753530936517.png]]

If you setup Secrets manager for RDS, Redshift, DocumentDB, Redshift cluster. The secret manager will automatically rotate the password using a lambda function behind the scences

Its better to use s3 hosting for static pages and take the load off of a database. Use elasticache when the content is frequency fetched from the database. Read replicas for read heavy database workloads

[[health-checks]] Apparent health to yes,tly you can set this evaluate targe which enables health checking and failover if the resource deemed to be unhealthy. ![[Tuts Dojo P3-1753532255062.png]]


Cloudfront origin shield - [additional caching layer](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/origin-shield.html)
![[Tuts Dojo P3-1753533296583.png]]

CW alarm if all instances became unhealthy 
	![[Tuts Dojo P3-1753533437605.png]] and dfine the alarm as `HealthyHostCount <= 0`

Backups and Auto Scaling in RDS and Aurora
- RDS backups data with user configurable 1 - 35 retension days
- [[rds - backups]]

- Aurora backups are continuous and incremental and retained up 1-35 days 
- [[aurora autoscaling]]

`DiskReadOPS` is only for instance store instances that will displayed under EC2 metrics. most of the EBS volume metrics starts with Volume*

You can't setup AWS Config aggregator on All AWS Resources in a organsiation, but you can seutp AWS config aggregatro on All AWS Accounts in a organisation. You'd need to enable in all accounts 

![[Tuts Dojo P3-1753534474271.png]]

Cost related services
- You can use CUR for reports
- you can use budgets for alerts
- You can use Cost Explorer usage trends and forecast
- You can use Billing Dashboard for pay outs and current month spends

**Detailed monitoring**
- EC2 instances that have detailed monitoring enabled. Instances that use basic monitoring are not included for aggregation across multiple AWS regions. You'd need to setup a metric math to aggregate the total
- With fewer data points, your ability to perform **fine-grained aggregation** is limited and inaccuragte

EBS **AutoEnableIO**
- When underlying hardware errors happens, aws stops the IO for that instance. Once resolved you'd need to enable the IO operation
- When Auto Enable is set up, you can expect that IO operations are re-enabled
![[Tuts Dojo P3-1753538471475.png]]


**Storage Optimised Instances**
> [!NOTE] Stores data locally, optimised for instance store instances
- An instance's EBS performance is bounded by the instance's performance limits, **or**
- the aggregated performance of its attached volumes, whichever is smaller
	gp3: Up to 16,000 IOPS (provisioned)
	io1 / io2: Up to 256,000 IOPS if using Nitro-based instances
	st1 and sc1: Lower throughput-focused, not IOPS-optimized
- For example, to achieve `80,000` IOPS for `r6i.16xlarge`, the instance must have at least `5` `gp3` volumes provisioned with `16,000` IOPS each (`5` volumes x `16,000` IOPS = `80,000` IOPS).

**EBS Optimised instance**
- The EC2 bandwidth to the EBS server will allocated more than for networking
- When you stop an instance, the data on any instance store volumes is erased. To keep data from instance store volumes, be sure to back it up to persistent storage.
![[Tuts Dojo P3-1753539550227.png]]
![[Tuts Dojo P3-1753539635556.png]]
![[Tuts Dojo P3-1753579299668.png]]
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-optimization-performance.html 
![[Tuts Dojo P3-1753579387084.png]]
Surely there's a link

**Custom vs Default NACL**
- The default NACL allows every connections, 
- Upon creation of custom NACL, you'd need to add allow, and everything is denied![[Tuts Dojo P3-1753538827806.png]]![[Tuts Dojo P3-1753538799327.png]]![[Tuts Dojo P3-1753538809568.png]]

**CFN Stack creation failures**
- `create-stack` api has an optional option `on_failure`
	- `DO_NOTHING`, `ROLLBACK`(default), or `DELETE`

**Blocking IP on NACL level vs WAF IP set**
- **NACLs** would only make sense if:
- The IP is attacking at **other network layers**, or
- You want to block access to **all resources** (not just web apps) in the subnet.
![[s3 Transfer accelerator and Global Accelerator]]

![[storage-gateway instance-disk-and-cache]]

![[storage-gateway volume-gateway]]

![[storage-gateway tape-gateway]]

AWS EMR - Apache Spark
Health Events on your cloud resources - AWS personel health or AWS health
Health Events on general - AWS Service Health

**CDN  vs Unlimited burst mode**
> Cloudfront is for improving LOAD Times
> Unlimited Mode in EC  not improve the latency

**Disk vs Volumes**
> Amazon EBS operates at the block level. It doesn’t know what’s going on **inside** the volume (like file deletions, filesystem usage, etc.). That’s the job of the operating system.

**Blackhole NAT**
> If you delete a NAT gateway, the NAT gateway routes remain in a **blackhole** status until you delete or update the routes. Hence, the correct answer in this scenario is that **the NAT Instance or NAT Gateway that was previously attached was deleted**.

> The option that says: **The Internet Gateway was detached from your VPC** is incorrect. Although detaching the Internet Gateway will affect the Internet connectivity of your application, this is unlikely to cause the **blackhole** status in your route table.
> 

NLB - handle millions of requests per second while maintaining ultra-low latencies

![[AWS Trusted Advisor]]

![[access logs]]