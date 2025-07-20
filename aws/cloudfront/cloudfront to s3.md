---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
- AWS's CDN service
- Cached at edge for perfomance
- UX 
- 216 edge locations

# Origins
- s3 bucket
	- For distributing the files across the edges
	- For uploading via cloudfront to s3
	- Secured using OAC Origin Access Control
- VPC origin
	- Application hosted in a private subnet?
	- ALB, NLB, EC2 instances
- Custom Origin (HTTP)
	- s3 website
	- any public http, in or out of aws
![[Udemy ScreenShot 2025-07-06 13-03-50.jpeg]]

![[Udemy ScreenShot 2025-07-06 13-04-57.jpeg]]


The Origin access control police gets automatically genereated when we use the recommended option
![[Screenshot 2025-07-06 at 13.16.18.png]]

