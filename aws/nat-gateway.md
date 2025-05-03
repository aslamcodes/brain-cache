# NAT Gateway
**N**etwork **A**ddress **T**ranslation

The Nodes reach to internet using the IP(eip) address of the NAT


Requirements
- Must be in a public subnet
- Must have a EIP attached
- Route to the NAT gateway in the private subnet in the RT

- For HA, NAT Gateway can be deployed across multiple DCs/AZs
