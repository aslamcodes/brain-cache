Deals with TCP and UDP (Layer 4) level traffic
Has one static IP per AZ and supports assinging EIP, helpful for whitelisting IPs

# Target Groups
- We can front NLB with ALB
    NLB for UDP/TCP and ALB for HTTP logic
- EC2 instances 
- IP addresses of EC2 instances or on prem instances

Health checks support TCP, HTTP, HTTPS
