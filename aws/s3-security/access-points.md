---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Instead of managing IAM policies, we can leverage access points

An access points is bridge of access between poeple with prefixes with origin from vpc + vpce(must) or internet

Appstream could be leveraged as a perfect origin 
![[accesspoint.jpeg]]

Sample access policy

```
{
    "Version":"2012-10-17",
    "Statement": [
    {
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::123456789012:user/Jane"
        },
        "Action": ["s3:GetObject", "s3:PutObject"],
        "Resource": "arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/Jane/*"
    }]
}
```
# Multi Region access point 
In multi region access point, bi direction replication will be setup between buckets in different region CRR
Has active failover configuration 
