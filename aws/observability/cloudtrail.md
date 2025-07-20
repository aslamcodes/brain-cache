---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Events History page list all the events happened in a particular account. 

Cloudtrail events can be injected into cloudwatch logs or s3
![[Udemy ScreenShot 2025-07-01 15-59-35.jpeg]]
# Cloudtrail events types
![[Screenshot 2025-07-01 at 16.43.04-1.png]]
## Management events
- Has option to separate read and write actions ## Data events
**Date events**
- data events are not logged by default
- Object level activity for s3 since they all happen at huge volume
- Lambda invokes
**Cloudtrail insights event**
- 
**Cloudtrail insights**
Difficult when events in an account is high in volume, and it might hard to detect unusalu activities
- Analyse for anythning destructive 
- Generates a baseline on top of normal activities

# Events Retention
cloud trail events are expired after 90 days, if you want to keep them longer, you would need to put them into s3 and analyse them with athena
![[Udemy ScreenShot 2025-07-01 16-27-06.jpeg]]