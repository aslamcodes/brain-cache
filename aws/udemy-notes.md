VPCs with same CIDR can't be in created

NACL - Stateless  
Sgs - Stateful

Stateless - Both inbound and outbound access are checked
Statefull - Only inbound are tracked (keeps the state that inbound is allowed hence outbound will too)

**Kinds of IP address**

*   Public - Lost on Stopping.
*   Private - Keeps the IP on stop.
*   Elastic - can be re-assigned.  

We can have ec2 instances with ENIs from different subnets from SAME AZ?

Association of the public IP address is done externally to the instance. The OS knows that this instance has a ENI attached with a Private IP address, that's probably why I see private ip when i try to ssh into a EC2 instance

EIP is a static IP address. can be moved between ENA

We have three types of Network Interfaces

1\. ENI
2\. ENA (adapter) - Higher Performance for supported instance types
3\. EFA (Fabric Adapter) - For MPI and ML use cases

# EC2
**EBS**
    - Primary Storage for EC2 instances
    - In windows you see them as C, D drives
    - Attached over network, the OS won't know about it
    - Automatically replicated for durability
    - gp3, gp2, io2, io1, st1, sc1, magnetic

io2, io1 supports Multi-attach where multiple instances can attach
**Instance store** are storage that's ephemeral and connected physically to the instance unlike EBS over network
AMI is essentially a OS, which is actually a **EBS Snapshot**

AMI -(launch)> Pending -()> Running -(reboot)>  Rebooting -> Running
                                                                    -(terminate)> Shutting down -> Terminated
**\# (Doubt)stopping is only for EBS backed instances?**
                                                                   -(stop)> Stopping-> Stopped -(terminate)> Terminated  
                                             (duplicate ⬆︎)  -(stop)> Stopping-> Stopped -(start)> Pending

**Facts on stopping**
\- No charge for stopped instance, but EBS is chargeable
\- Stopping and Starting makes the instances to be in different host
\- Data in RAM is Gone

**Hibernating**
\- RAM contents saved to EBS volume
\- On Demand or Reserved linux instances only
\- Must be enabled when launching, that's why I never seen it

**Rebooting**
\- Does not affect billing
\- OS reboot
\- DNS name and IP address are retained

**Retiring**
🚨 AWS instances can be retired and terminated by AWS when the underlying hardware get's corrupted.

**Terminating**
\- Deletes the instances, Can't be recovered
\- Default root EBS volume is deleted, additional volumes stays

# Serverless
**Use cases for lambda**  
Data Processing
Real Time file processing
Real Time stream processing
Serverless backends

**Direct Integration vs Decoupled Services**
\- What happens if the load is increased much, ASG will take several minutes to respond, **failure** will occur
\- If you introduce a **SQS queue** in the middle, you essentially decoupled the Web tier and App tier

_Fire and Forget for the tiers._

**SNS**
\- Pub Sub Model

# Storage
**File Storage**
\- Has hierarchy, much like local storage
\- Can be mounted to OS

**Object Storage**
\- Flat namespace (mimics with Prefix)
\- Available via a REST api, can't be mounted

**EFS**
\- File based storage system from AWS
\- Region scoped
\- EFS is only for Linux instances
\- Can be shared with multiple VPCs via VPC peering, Transit Gateways or VPN or DC

**FSx**
\- Fully managed third party file system
\- FSx for Windows File Server **(or)** FSx Lustre for compute intensive workloads
EFS for Linux
FSx for Windows

**Pre-req for Mounting EFS on Linux**
\- There is a DNS endpoint which is Mount DNS
\- Mount Targets can be created for Each AZ
\- You have to attach a SG rule, for 2049 NFS protocol inbound from the the SG of EC2
\- You create a mount point in the **EC2 intance**, which you mount to the **endpoint**
\- IAM roles and resource based policy can be used by NFS clients

# Database
**RDS**
\- Runs on EC2 instances
\- We have to choose the instance type
\- Managed relational database

**Supported Engines**
\- Aurora
\- MySQL
\- MariaDB
\- Oracle
\- MSSQL
\- PostgreSQL

  

RDS is used for OLTP use cases,

Online stores and Banking systems

Data encrypted at **rest** with KMS keys

  

**RDS Scaling**

\- Change the instance type to get more hardware

\- Scale vertically for Write Scaling and horizontally for read traffic

**AWS Aurora**

\- DB offering in RDS family

\- AWS created it

\- MySQL and PostgreSQL compatible

\- 5x and 3x faster than MySQL and PostgreSQL respectively

  

Aurora Features

**Elasticache**
\- Redis and Memcached
\- Key value store
\- In Mem DB -> High performant and low latent
\- Used in front of DBs such as RDS and Dynamo DB
\- Nodes run on EC2 instance, we choose the family type

**RDS Security**
\- RDS DB will have the IP address
\- RDS can have SG attached
\- EC2 instances that wants to connect will have SG configured to allow on port 3306
\- SSL and TLS for Data in transit
\- RDS encryption (AWS KMS) for DB volume, Snapshots,  backups and read replicast for Data at rest
\- Encryption can't be reverted both ways

  

Exam Tips
\- Encrypted read replica of un-ecrypted DB instance isn't possible vice versa
\- The Same KMS key is used if replica is in same region, else different
\- Unencrypted backup/snapshote of encrypted db instance isn't possible

Cloudwatch
\- Performance Montoring
\- Log Collection
\- Alarms
\- Automated Actions from Resource event (event bridge)

**Let that sink in**

**Cloudwatch Metrics**

\- CPUutilization, DiskReadOps, NetworkIn, StatusCheckFailed

\- Disk Usage and Memory needs **the cloudwatch agent**

**Metrics intervals**

\- Metrics are sent every 5 minutes -  standard **free**

\- Metrics are sent every 1 minute - detailed **cost**

**Custom Metrics**

\- Custom metrics can also be sent

      - Standard resolution (data granularity every one minute)

      - Higher resolution (data granularity every one second)  
  
`_AWS metrics are in standard resolution by default_`

**Alarms**

\-  Metric Alarms **or** Composite Alarms (multiple alarms)

\-  Alarms States **(OK/ALARM/INSUFFICIENT\_DATA)**

\- **set-alarm-state** api can be used for testing with alarm states

**Metrics**

_Metrics - Time Ordered set of Data_

\- Metrics are **_region scoped_** since the least resources aws ec2 is limited to AZ.

\- Metrics **_Expire_** after **15 months,** can't be **deleted**

\- Uniquely _identified_ by `Name` ,  `Namespaces`, `0 or more dimensions`

\- **_Time window_** for metrics **t-14d** to **t+2h**

**Metric Data Retainment**

\- data interval < 60s - retained for 3 hours

\- data interval = 1min - retained for 15 days (half a month)

\- data interval = 5min - retained for 63 days (2 months)

\- data interval = 1 hour - retained for 455 days (15 months)

**Namespaces**

\- _A Container for Cloudwatch Metrics_

\- Each **Data Point published** should have an _namespace given_

\- Namespace name can be specified when create a metric

  

**Dimensions**

*   So to say, Categories
    
*   Key value pair that identify a metric
    
*   Up to 10 dimensions
    
*   Organize and Filter metric day based on attributes
    

**Statistics**

\- Data aggregation over a period of time

\- Min, Max, Sum, Avg, SampleCount, Percentile

Unified Cloudwatch agent

\- Collect internal system level metrics  from Ec2 and onPrem

\- StatsD and CollectD

We need cloudwatch agent for anything that's not visible to the hypervisor.  
  
CPU, Disk, Network in, Network Out (Hypervisor Level)  
Other metrics - https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/metrics-collected-by-CloudWatch-agent.html  

**Agent Installation 4 step process**

\- IAM role that allows the agent to write metrics to cloudwatch

\- The configuration file that determines what to push

Logs Features

\- Logs insight can be used to analyse logs data

\- Create alarms based on API activity???

\- Logs never expire but can be set to, 1 day to 10 years

\- DNS queries for Route 53 can also be logged

Logs Concepts

\- Events (A Log activity)

\- Streams (Stream of events)

\- Groups (Group of Streams)

  

\- Metric Filter (Gets metrics from logs)

\- Retention Settings

**SNS in a Nutshell**

\- Decoupling

\- system - Notification - system

\- Publisher/Producer sends message to a topic

\- Subscribers subscribes to the topic

\- Subscribers gets the message through various transfer protocols

\- Subscribers can be web app, sqs, lambda

**SNS + SQS Fan Out architecture**

\- Subscribe one or more SQS queues to SNS topic

\-  One Topic with different queues with reductant copies of same messages at same time

SNS Fifo vs Standard

\- SNS ensures you don't publish duplicates, SQS FIFO ensures the messages are consumed in order  
\- If you opt for SNS fifo, you have to only integrated with SQS fifo, and have your applications poll the messages (Strict ordering and deduplicated)

**Who** _did what_ at **when** on **what** resources

AWS Config is not a configuration service, rather it is a **compliance & governance services**

**SSM**

\- Application management

\- Change management

\- Node management

**Event Bridge**

\- AWS Services, Custom Apps, SaaS Apps **produces** events

\- Events **travel** on a _bus_

\- Buses have rules with a specific pattern & with specific target(s)

**Targets can be**  
\- EventBridge event bus - If you'd need to fan out a certain event to busses on different accounts

\- EventBridge API destination - External REST API endpoints

\- AWS service - Lambda, State machine, SNS, SQS....

EC2 instances

On Prem Servers

VMs & VMs hosted on other cloud providers

  

Via a agent.

\- Ec2 instances - Instance profiles for iam role

\- Hybrid environments - IAM service role is used with Hybrid activation

Scales

\- AWS EC2

\- AWS EC2 Spot Fleets

\- AWS ECS (Desired count up/down)  
\- AWS DynammoDB (RCUs/WCUs)  
\- AWS Aurora  -Number of read replicas

ASG works by using CW metrics, that the targets push to.

4:03

1\. Launch Templates (AMI, EBS volumes, Key Pair, Instance Profiles, Tenancy, ...)

2\. On Demand vs Spot

3\. Configure VPC subnets

4\. Load Balancers can be attached

5\. EC2 Health checks

6\. Group Size and Scaling Policies

5:20

**ASG Health Checks**

\- EC2 = EC2 Status checks

\- ELB = Uses the ELB health checks + Status checks

**Types of Auto Scaling**

\- Dynamic - _Scales on Demand_

\- Predictive - _Scales based on Machine Learning Predictions_

\- Scheduled - _Scales on prescribed schedule_

Storing Session data - External or Cookies.

External - Dynammo DB, Elasticache, s3

Internal - Cookie (Sticky session, redirected to same instance till the lifetime of the cookie, since the cookie details might be stored in the instance)

**Backup**

\- You don't wanna backup db on the peak hours, since it may put a load on the system

\- Brief IO interruption when the backup starts,

\- You would pick a time period off of business hours

**Automated RDS Backups**

\- Snapshot & Transaction Log is sent to S3

\- Retention is 0-35 days

\- Restoring a backup snapshot, results in a new DB instance, ie **new endpoint**

\- Backup needs the instance to be in available state

\- Automated backups can be replicated to any AWS region

**Manual Backups or Snapshots**

\- No retentions period for the snapshots

\- Backs up the entire **database instance,** not just individual databases?

\- Suspension of IO

Transaction logs are the changes to the database, since the last failure to the point of backup, this is needed for restoring the database

**RPO**

\- Recovery Point Objective

\- Amount of data that can be Acceptebly lost, in time

\- 2hr RPO

\- Less RPO more Cost

**RTO**

\- Recovery Time Objective

\- Time takes to restore from a Disaster event

\- Measured in time

RTO & RPO mappings

**AWS Backups**

\- Centralized backup for various services, ec2, ebs, s3, rds..

**AWS Data Life cycle manager**

\- Manages & Automates the creation, retention, and deletion of EBS snapshots and EBS Amis

AWS RAM - Sharing is caring
