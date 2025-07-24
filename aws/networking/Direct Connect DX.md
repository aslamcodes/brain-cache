---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
# Architecture
![[Direct Connect DX-1753335913338.png]]
> Essentially a dedicated private connection between on-prem and aws in the high level. 
**Core Components:**
1. **Customer Router:** Your on-prem router that connects to Direct Connect via a dedicated line.
2. **Direct Connect Location:** AWS’s colocation facility where AWS provides a Direct Connect router (partner or AWS-managed).
3. **Cross Connect:** Physical fiber link between your router and AWS’s router in the colocation.
4. **AWS Router (DX Router):** Terminates the Direct Connect connection; connects to AWS backbone.
5. **Virtual Interfaces (VIFs):**
    - **Private VIF:** To access VPC resources.
    - **Public VIF:** To access AWS public services (e.g., S3, DynamoDB).
    - **Transit VIF:** For multiple VPCs via a Transit Gateway.
**Data Flow:**  
On-prem → Customer Router → Cross Connect → AWS DX Router → VIF → VGW/Transit GW → VPC
# and More
- Direct Connect Connection
- [[bgp|BGP]]
- LOA-CFA
- Direct Connect Gateway (DXGW)
- [[Transit Gateway]]
- Redundant Connections (for HA)
- Link Aggregation Group (LAG)
- Router Peer IPs / ASN
- Route Tables
- Colocation Facility / Partner Network
![[Udemy ScreenShot 2025-06-30 12-01-20.jpeg]]
Dedicated private connection to remote network into VPC
Hybrid Model
VGW is used to setup the connction
Consistent network experience and increased bandwidth

AWS Cage | Customer or partner cage for rent a router
S2S as backup
- If theres' an issue, you can setup S2S as backup for resiliency