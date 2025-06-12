# Application Load balancers
Since works on layer 7
- Routing based on path in URL
- Based on hostname
- Based on query strings also

Target Groups
- EC2 instances
- ECS Tasks
- Lambda functions
- Private Ip address

The IP address will be in X-Forwarded-For 
The Port will be in X-Forwared-Port
The Proto will be in X-Forwarded-Proto


