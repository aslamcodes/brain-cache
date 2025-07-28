---
tags: 
type: 
date: 2025-07-27
done: false
---
| Feature         | **AWS Config**                                      | **SSM Compliance**                                                                     |
| --------------- | --------------------------------------------------- | -------------------------------------------------------------------------------------- |
| **Purpose**     | Tracks and evaluates configuration of AWS resources | Monitors compliance of managed instances with patch, association, and custom baselines |
| **Scope**       | AWS resources (e.g., S3, EC2, IAM, etc.)            | EC2 instances (managed by SSM)                                                         |
| **Granularity** | Resource-level compliance                           | OS-level (patches, configs)                                                            |
| **Rules**       | Uses Config Rules (AWS-managed or custom Lambda)    | Uses Patch Baselines, Associations, and Custom Inventory                               |
| **Remediation** | Supports automatic remediation                      | Can use SSM Automation for remediation                                                 |
| **Data Source** | AWS API (resource configuration snapshots)          | SSM Agent (installed on instances)                                                     |
| **Use Case**    | Cloud governance, audit, security compliance        | Patch management, software configuration compliance                                    |
