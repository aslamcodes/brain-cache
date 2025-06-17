- Handle failures of downstream instances seamlessly
- Health checks
- SSL terminations
- Stickiness with cookies
- HA across AZs
- serves as facade public internet for downstream instances

# Elastic load balancer
- Integrated with lot of aws services
	- EC2, ECS, ASGs, ACM, Cloudwatch, Route53, WAF, Global accelerator
- Costs lesser than managing our own

# Health Checks
- Check if ec2 is okay to recevie
- Done by protocol, port and endpoint
- Responds with 200, fine, else not.

> If unhealth it means either it can't communicate or the response code is not 200

# Types of load balancers
- Classic Load balancer (Deprecated)
	- HTTP, HTTPS, TCP, SSL
- Application load balancer (ALB)
	- HTTP, HTTPS, WebSocket
- Network Load balancer (NLB)
	- TCP, TLS (SSL), UDP
- Gateway Load balancer (GWLB)
	- IP (layer 3)

Some can setup internal or external

Users can access load balancers from anywhere
Ec2 instance allow http on port 80

