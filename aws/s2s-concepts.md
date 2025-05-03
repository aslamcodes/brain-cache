# VPN 
VPN connection: A secure connection between your on-premises equipment and your VPCs.
VPN tunnel: An encrypted link where data can pass from the customer network to or from AWS.
Each VPN connection includes two VPN tunnels which you can simultaneously use for high availability.

> The vpn tunnel, is what that is based on IPSec, VPN connection refers to the abstract concept of two vpn tunnels enabling VPN connection

# Customer Gateway
Customer gateway: An AWS resource which provides information to AWS about your customer gateway device.
Customer gateway device: A physical device or software application on your side of the Site-to-Site VPN connection.

> You probably setup a device on on-premises, and you create a AWS resource customer gateway, which lets AWS know the device

# VPN Endpoints
Target gateway: A generic term for the VPN endpoint on the Amazon side of the Site-to-Site VPN connection.
Virtual private gateway: A virtual private gateway is the VPN endpoint on the Amazon side of your Site-to-Site VPN connection that can be attached to a single VPC.
Transit gateway: A transit hub that can be used to interconnect multiple VPCs and on-premises networks, and as a VPN endpoint for the Amazon side of the Site-to-Site VPN connection.

> VPN endpoint or Target gateway, in AWS is either VPW or TGW

# General
Autonomous System
- Group of IP networks, run by one or more network operators, Adminstrative entitty (ISPs, Enterprise, Mobile Networks, Telecomm Network Operators..)
- So essentially, a Self operating network (of a large scale or ?) with self managed routing policy

ASN:
A Number for identification for the ASes, assigned by internet registries
Here are some regional internet registries
- ARIN: American Registry of internet numbers, North America
- APNIC: Asia Pacific
- AFRNIC: Africa
- RIPE: Regional Internet Registry for Europe, Middle East and Central Asia
- LACNIC: Latin America and Caribbean

So internet is routing between ASes?
