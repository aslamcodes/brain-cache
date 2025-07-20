---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

AWS services like ASG, SSM, RDS will have default attached role managed by AWS

1. AWSServiceRoleForAutoScaling
Used by: EC2 Auto Scaling

Purpose: Launch/terminate/manage EC2 instances in Auto Scaling Groups.

2. AWSServiceRoleForEC2Spot
Used by: EC2 Spot Instances

Purpose: Request, manage, and terminate Spot Instances.

3. AWSServiceRoleForElasticLoadBalancing
Used by: Elastic Load Balancing

Purpose: Register/deregister instances with load balancers, manage health checks.

4. AWSServiceRoleForOrganizations
Used by: AWS Organizations

Purpose: Manage accounts and apply policies across an organization.

5. AWSServiceRoleForAmazonSSM
Used by: Systems Manager

Purpose: Perform actions like patching, session management, inventory collection.

6. AWSServiceRoleForAmazonRDS
Used by: RDS

Purpose: Manage backups, monitoring, and maintenance tasks.

7. AWSServiceRoleForECS
Used by: Amazon ECS

Purpose: Manage ECS tasks, services, and container instances.

8. AWSServiceRoleForCloudTrail
Used by: CloudTrail

Purpose: Manage CloudTrail log files and integration with other services.

