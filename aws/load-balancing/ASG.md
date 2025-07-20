---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Desired Capacity - The Goal ASG tries to match at any given time
Minimum and Maximum capacity - as it sounds

launch templates are primarily to choose the ami id, others are optional, can be configured based on the needs

health checks can be passed down to ASG, and ASG will terminate the instance. 

Scaling Polices; Intergrates with cloudwatch, and scales (out/in) based on cloudwatch alarm which is based on a metric. ex. AvgCPU
- Target Tracking - Tracks a particular metric until it satisfies the target by performing scalilng activites
- Simple Step scaling - Cloudwatch alarm is triggered, scale in and scale out alarm
- scheduled scaling 
- Predictive based on ML

Metrics to scale on
- mostly depens on application
- Usually CPU utilization, request count per target, 
- network in out
- any custom metric

There are hooks that we can use, to define custom logic in between an ASG instance lifecycle, also integrated with event bridge for us to integrate with event driven services
![[asg-lifecycle.jpeg]]

# Launch Configuration vs Launch Template
https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html?icmpid=docs_ec2as_lc_banner 

# SQS and ASG
- On Metric Name, Approx Number of messages, -> alarm -> Trigger scalling

# Health Checks
EC2 Status checks
EBS volume check
Custom health check via set-instance-health api

# AWS Auto Scaling
All the scalable resources in aws
