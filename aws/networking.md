# VPC +2
> VPC+2 ip address is a shorthand for a VPC's ip address and .2

if the CIDR of an VPC is `16.0.0.0/16`, then vpc+2 would be `16.0.0.2`


# AWS Privatelink
"Endpoint service powered by privatelink is always going to be behind a load balancer" 

# NAT Gateway
**N**etwork **A**ddress **T**ranslation

The Nodes reach to internet using the IP(eip) address of the NAT


Requirements
- Must be in a public subnet
- Must have a EIP attached
- Route to the NAT gateway in the private subnet in the RT

- For HA, NAT Gateway can be deployed across multiple DCs/AZs

# AWS & Endpoints
AWS services are accessed via a public endpoints like `protocol://service_code.region_code.amazonaws.com`;
for example, https://monitoring.us-east-2.amazonaws.com

> Abstractly VPC endpoints are way to access these endpoints without an Internet Gateway

# Interface Endpoint
VPC endpoint is powered by AWS Privatelink.

Billing - For each hour + Per GB of data processed, using privatelink's pricing


 
