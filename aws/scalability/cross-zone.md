# Cross Zone Load Balancing
Each Load balancer instance evenly distribute the traffic across load balancers

> If 10 instances, 2 in one AZ, 8 in other AZ, all of them will get 10% of traffic

Without Crossload balancing
- Traffic is distrbute EVENLY across Load balancers NOT instances

Enabled by default for ALB
Disabled by default for NLB and GWLB, if enabled, then inter AZ data needs to paid 
