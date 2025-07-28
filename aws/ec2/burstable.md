---
dg-publish: true
tags:
  - review
type: 
date: 19th July 2025
done: false
---
- Offers guaranteed amount level of CPU performance
- Has the ability to burst to high level on spiky loads
- Baseline CPU governed by "CPU Credits"
- "Credits" Accumulate when the instances operate below the base line and vice versa
- Most general application that needs quick access to CPU but most of the time moderate levels of CPU
- 1 CPU credit = 1 vCPU running at 100% for 1 minute.

|Instance Type|Max CPU Credit Balance|
|---|---|
|`t3.nano`|72|
|`t3.micro`|144|
|`t3.small`|288|
|`t3.medium`|576|
|`t3.large`|864|
|`t3.xlarge`|1,152|
|`t3.2xlarge`|1,536|
- **T3/T4g Unlimited Mode:** Allows instances to burst beyond their baseline even when CPU credits are exhausted — but incurs **extra charges**.

# Usecases
- Many workloads don't require constant CPU performance all the time.
- Microservices or low-traffic APIs
- Development or staging environments
- - Web servers with sporadic traffic
