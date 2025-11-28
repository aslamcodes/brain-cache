---
tags:
type:
date: 2025-09-22
done: false
---
# EC2
# Identifying Compromised instances
- 
# Checklist - Addressing the issues
- [ ] Capture instance's metadata - Collect `instance-id`, AMI, private/public IP, SGs, IAM role, user-data, tags. Use `aws ec2 describe-instances`
- [ ] Enable termination protection - [[Handling Compromised resources#**Bad Actor's Termination**|Look here]]
- [ ] Isolate instance - block all outbound
- [ ] Detach from ASGs - Prevents replacing the instance
- [ ] Deregister from ELB - No traffic to be handled by this instance
- [ ] Snapshot the EBS - for deep analysis and forensics
- [ ] Tag the instance - for investigation

## Bad Actor's Termination
	- Wipes volatiles data - Malware, keys, processes will be gone, would be crucial for investigation
	- Destroy logs - local evidences gets removed, if not shipped
	- Potential Clues gets removed for investigation, could be very helpful
	- Makes it harder to snapshot
	Basically, termination is about **destroying forensic evidence**
# S3
- Identify via [[Guardduty]]
- Identify the IAM source and its authorisation
- Recommended settings
	- Block public access
	- Review bucket policies and IAM policies
	- use VPC endpoints for s3
	- S3 access points
	- S3 ACLS

![[Handling Compromised resources 2025-09-22 10.43.32.excalidraw]]

# RDS
- **Identify** via [[Guardduty]]
- Rotate DB password
- Use IAM DB authentication
- Review DB Audit logs
- Suspend access to the suspected DB user
- Restrict network access (SGs, NACLs)