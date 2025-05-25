Previously called Amazon DNS Server

Available by default in all vpcs or is it available on our wish?

# Resolver
- An Route53 resolver is available in every VPC by default so that we can resolve VPC specific ip addresses, manage public and private hosted zones
- An Amazon VPC connects to a Route 53 Resolver at a VPC+2 IP address. 
- This VPC+2 address connects to a Route 53 Resolver within an Availability Zone.

# Outbound/Inbound Resolver Endpoint
Inbound Resolver Endpoint - From On Prem to Resolver over S2S or DX
Outbound Resolver Endpoint - From Resolver to On Prem over S2S or DX
DNS Forwarding rules are created and attached to VPCs and the respective resolvers uses the rules

# Doubts
1. VPC is a region bound, VPC+2 is going to be a static IP address, and how route53 resolvers in the different availability zones gets the same IP address? 
- You create subnets with CIDR ranges and subnets can be created in same or different AZs, will that apply for VPC+2 Ip address also?

2. Are DNS resolvers is created per Account, and uses default VPC's VPC+2 ip address or its for all VPCs with that VPC+2 ip address in the account



