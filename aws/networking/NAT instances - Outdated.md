---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

NAT will just rewrite network packets. Masking the origin ip and replace it own
Nat instances must be launched at public subnets
Must have a elastic ip attached to it 
Must disable source/destination checks - this will allow
Amazon managed AMI, end of support at 2020. can be used to setup a NAT instance. we would need to manage it via ASG, user data script, ports and stuff

# *Questions*

**1. Why would we need to disable source/destination check? Any EC2 instance will only receive packets that are meant for itself right.**
You set at the route table level, to go through the instance. If you enable source/destination check it will just drop the request. 

You have routing software installed in the instance, otherwise nothing happens.

**1.1 But then why would any request can be handled by a server with destination not meant for itself??**
IP operates at Layer 3 (Network Layer) of the OSI model, which is responsible for logical addressing and routing packets from source to destination across networks[1](https://www.cloudflare.com/learning/network-layer/what-is-the-network-layer/)[3](https://testbook.com/question-answer/ip-addresses-are-used-on-which-layer-of-osi-refere--6257fafe2f5ea2c46e31cf72)[4](https://www.bmc.com/blogs/osi-model-7-layers/)[5](https://www.practicalnetworking.net/series/packet-traveling/osi-model/)[8](https://www.fortinet.com/resources/cyberglossary/osi-model). The IP address identifies the source and destination endpoints for end-to-end delivery.

However, the actual forwarding and acceptance of packets at a given device depends heavily on Layer 2 (Data Link Layer), which deals with physical addressing via MAC addresses. Layer 2 handles delivery of frames from one network interface to another on the same local network or hop. Each frame includes source and destination MAC addresses that identify the immediate sender and receiver on that local link[4](https://www.bmc.com/blogs/osi-model-7-layers/)[5](https://www.practicalnetworking.net/series/packet-traveling/osi-model/).

**2. How nat will know which origin server it needs to returns to?**
NAT leverages ephemeral ports to distinguish and manage multiple simultaneous connections from private IP addresses using a single public IP address.

When a private instance (e.g., 10.0.1.14:3334) initiates a connection to an external server, the NAT device replaces the source IP and port with its own public IP and a **unique port** (e.g., 54.23.12.101:61000) and records this mapping in the table.