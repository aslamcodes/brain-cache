---
tags:
  - todo
type: 
date: 2025-07-20
done: false
---
# Lambda
- **`Invocations`**  
    → Total times your function was called.
- **`Throttles`**  
    → Number of times Lambda was **denied execution** due to concurrency limits.
- **`ConcurrentExecutions`**  
    → Total **currently executing** Lambdas across your account.
- **`ProvisionedConcurrentExecutions`**  
    → Executions served by **provisioned concurrency**.
- **`UnreservedConcurrentExecutions`**  
    → Executions served from **default pool** (not reserved).
# EBS
- `VolumeQueueLength`
	- RAID 0 boosts performance but has **zero redundancy**
	- RAID 10 offers performance **and** fault tolerance
	- If **cost doesn't matter**, RAID 10 + io2/io2 Block Express is ideal
	- For **non-critical, disposable data**, RAID 0 is fine
	- In RAID 0, **one volume fails = total data loss**
	- Use RAID 0 only if workload tolerates full data loss
# References
- https://tutorialsdojo.com/amazon-cloudwatch/
- https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/application-insights-recommended-metrics.html
- https://www.cloudzero.com/blog/cloudwatch-metrics/