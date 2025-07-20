---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Connect to aws services privately. 

Interface endpoints is powered by *aws privatelink*
- Supports most aws services, cost per hours, costs per data
- Provisions an ENI as entrypoint
- Leverages on DNS hostnames feature, to direct to this private ip for any services

Gateway endpoints is only for s3 and dynamo db, must be used as a target in route 53