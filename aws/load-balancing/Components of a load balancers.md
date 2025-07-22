---
tags: 
type: 
date: 2025-07-22
done: false
---
# Components of a AWS load balancers
- Listener
- Rules
- Actions

# Listener
> A process that checks for incoming traffic based on your configuration and reacts based on the rules
- Listens on a specific port (e.g., 80 or 443) for incoming traffic.
- Configurations
	- Protocol
	- Port
	- TLS termination

> [!NOTE] Each listener must have at least one default rule.

https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#listener-rules
# Rules
- Rules will get attached to  a load balancer
- Each rule has a priority and priority det
# Action
- https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#rule-action-types
- redirect, forward, fixed response....
