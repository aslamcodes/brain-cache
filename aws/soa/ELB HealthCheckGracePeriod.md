Official definition - The health check grace period specifies the minimum amount of time (in seconds) to keep a **new instance** in service before terminating it if it's found to be unhealthy.

Does that mean, if my instance when found to be unhealthy, wait for the health check grace period and proceed?
No only for **new instances**, not the existing ones

> [!NOTE] The default value for `HealthCheckGracePeriod` is 0 if created from API or CLI. For console its 300 seconds

