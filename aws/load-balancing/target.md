---
tags: 
type: 
date: 19th July 2025
done: false
---
Slow start
- Time load balancer gives for a given target to warm before it receives it full share of requests
Routing Algorithm
- Least outstanding request - Routes to lowest request in queue
- Round robit - One after the other
- Flow hash (NLB) - Takes in the hash from the request data and routes to same instance for the hash. NLB primarily uses this. 
Target group weighting
- Choose weightage over target groups, on how much traffic goes into