---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

# Overview
- Primarily operates on application layer 7
- Deployed on layer 7 friendly services such as ALB, Gateway, cloudfront
 - Define WACL Web Access Control List
 - Protects from common sql injection and Cross Site scripting (XSS)
 -  Rate based rules for DDoS protection
# Rules
- Rules include
	- IP address
		- IPSet resource are collection of IPs that we can define and attach to a Rule
	- HTTP headers
	- HTTP body
	- URI strings
- Rules can be set up with a cloudwatch metric for matches
- 
# Managed Rules
- There are managed rules also, IP reputation list, and by third parties, which needs to paid based on use
- The managed rules come with its own WCU
# WCU - WACL Capacity Units
- Has a hard limit on how much you can do with a rule
- Ceils at 1500
- This is to prevent too much processing for a rule

# WAF Rule Builder
Use custom logic such as conditionals to land on a specific action 
