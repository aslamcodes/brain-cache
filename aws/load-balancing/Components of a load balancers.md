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
# Rules
- Rules will get attached to  a load balancer
- 