---
tags: 
type: 
date: 2025-07-27
done: false
---
**Tag Enforcing**
- Use AWS organisation's tag polices to enforce what are the things that should go into an tag, the capitalisation and accepted values. However you cannot enforce tag creation with it. You would need to use SCPs to do that.
- You can use [[resource group]]'s tags editor to Find resources and tag them whatever you want
- This is useful if you need to enforce tag creation.
**Pending to Terminated when created**
- EBS Volume limit reached
- EBS Snapshot is currupt
- You don't have permission to the KMS key
- The instance store AMI is missing a part
**instance store AMI**
- The instance store AMI is basically a AMI configuration + Ec2 bundle
- The ec2 bundle gets stored on s3
```
s3://my-ami-bucket/
├── my-ami-name.manifest.xml
├── my-ami-name.part.0
├── my-ami-name.part.1
├── my-ami-name.part.2
├── ...
```
- if one of the part gets deleted, the instance go from `pending` to `terminated` straight away

**You'd get insufficient capsacity when**
- The AZ Don't have Capacity
- Reserve capacity beforehand and try to launch in another AZ
**InstanceLimitExceeded**
- You exceeded your Quota

**SystemManager Limits**
> concurrently executing automations (25) and maximum duration an automation execution can run (12 hrs).

**Cloudfront Monitoring**
- **Popular Objects Report**
	- As the name tells, the most 50 objects at a interval
	- View data as per data
- **Usage Reports**
	How much you actually use it
		Number of requests 
		Data transferred by protocol and data transferred by destination 
			By protocol
			By destination
- **Cache Statistics Reports**
	- All the caching stuffs, like hits and misses
- **Top Referrers Reports**
	Common Sources in Top Referrers:
		Search engines (Google, Bing)
		Social media (Twitter, Facebook, LinkedIn)
		Forums (Reddit, Quora)
		Partner or affiliate websites
		News articles or blog posts
- **Viewers Reports**
	- Devices
	- Browsers
	- OS
	- Locations