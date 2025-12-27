---
tags: 
type: 
date: 2025-07-28
done: false
---
AWS Quota Monitor
AWS Detective
You can have cross region cross account widgets in Cloudwatch dashboard

[[Traffic Mirroring]] don't have the access to drop packets and Target MTU should be higher, or else packets will be truncated
AWSTOE - A component of ec2 image builder
Ec2 image builder's workflow, added functionalities like conditionals on top of pipeline

For immediate access use file gateway

inspector -> Ec2, ec2, lambda, 

RDS backups for point in time recovery is 1 to 35 days with 5 minutes diff

 By default, the `enableDnsHostNames` is set to false for VPCs created using the AWS CLI

Open search - Deploy three **master** nodes to different Availability Zones and deploy four storage nodes into multiple Availability Zones.

| **Use Case**                          | **Recommendation**                                   |
|--------------------------------------|------------------------------------------------------|
| Light use (dev/test)                 | 3 total nodes (all roles on each)                    |
| Moderate prod                        | 3 master + 3 data (6 total)                          |
| Heavy search or indexing             | 3 master + 6–12 data + 1–2 client                    |
| Logging/monitoring with retention    | Add **UltraWarm** or **cold tier nodes** if using plugins/extensions |

SMB and NFS - File Gateway - S3 
[[iSCSI]] - Volume gateway - S3 (EBS Snapshots)
[[iSCSI]] VTL - Tape Gateway - S3 (virtual tapees) and S3 Glacier (Archives)

You want to increase the storage space of the stored volume gateway, you'd create a snaphot and use the new volume created from that snapshot


![[PT5-1753768323041.png]]


If you enabled versioning and MFA Delete, these two require auth
- **Change the versioning state of your bucket**
- **Permanently delete an object version**

**Ensuring bucket owner has full control**: That would require the canned ACL `bucket-owner-full-control`, which is not used here.

```
"Condition": {
  "StringEquals": {
    "s3:x-amz-acl": ["public-read"]
  }
}
```

```
"Condition": {
  "StringEquals": {
    "s3:x-amz-acl": ["bucket-owner-full-control"]
  }
}
```

|Canned ACL|Who Gets Access|What They Can Do|
|---|---|---|
|`private` (default)|Only the object **owner**|Full control|
|`public-read`|Everyone (anonymous users)|Read (download)|
|`public-read-write`|Everyone|Read and **write** (⚠️ very insecure)|
|`authenticated-read`|Any AWS account|Read|
|`bucket-owner-read`|Bucket owner|Read|
|`bucket-owner-full-control`|Bucket owner|Full control

![[PT5-1753776962104.png]]