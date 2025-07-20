---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

**Perplexity**: Broadcasting is less noisy, as we have breakout subnets

**Me:** Alright, is broadcasting that much important in network and it clogs the network? I don’t seem to see applications leveraging broadcasting feature
  
**Perplexity**: Broadcasting in networks is a mechanism where a message sent by one device is delivered to all devices within the same subnet or broadcast domain without needing to know individual recipient addresses. While broadcasting is fundamental for certain network functions—such as ARP (Address Resolution Protocol), DHCP, and some discovery protocols—its excessive use can lead to network congestion, often referred to as "broadcast storms," which degrade performance by flooding all devices with unnecessary traffic.

However, many modern applications and network designs minimize reliance on broadcasting because it can clog the network, especially in large or segmented networks. Instead, unicast or multicast communication methods are preferred for efficiency and scalability. This is why subnetting and VLANs are commonly used to create smaller broadcast domains (breakout subnets), effectively limiting the scope of broadcast traffic and reducing noise on the network[7](https://www.pynetlabs.com/what-is-broadcast-domain-in-networking/)[6](https://en.wikipedia.org/wiki/Subnet).

In summary, broadcasting is important for specific network protocols but is generally minimized in application-level communication due to its potential to congest networks. Network designs use subnetting and VLANs to contain broadcast traffic within smaller domains, thus improving overall network performance 

---

**Perplexity** Service: providers, security providers can manage their services per subnet level: Makes sense 👍

---
**Perplexity**: Security breaches’s blast radius is reduced to subnet level. 
    
**Me:** Isn’t the whole network accessbile to a particular instance or, subnets are actually individual networks. Like docker containers. I was thinking it was just series of splites in ip range?  
	  
**Perplexity**:
> Subnets are not just arbitrary splits of an IP range; they function as distinct logical networks within a larger network, often with enforced boundaries that control communication between them. Unlike Docker containers, which are isolated at the application or OS level, subnets isolate network traffic at the IP routing and switching level. Resources within one subnet cannot freely access resources in another subnet unless explicitly allowed through routing rules, firewalls, or access control mechanisms[1](https://intellipaat.com/blog/what-is-a-subnet/)[2](https://nilesecure.com/network-security/network-isolation-what-it-is-how-it-works-for-security)[5](https://netseccloud.com/the-impact-of-subnets-and-vlans-on-network-security).
> 
> Network segmentation is a technique used to divide a network into smaller, isolated segments. This can be achieved using physical devices such as  [routers](https://www.numberanalytics.com/blog/isolation-techniques-for-network-security#),  [switches](https://www.numberanalytics.com/blog/isolation-techniques-for-network-security#), and firewalls. By segmenting a network, you can:

---

**Perplexity**: We can logically label subnets based on their purposes


--- 

**Perplexity**: Smaller networks are easier to maintain

"I can get it from security perpective, performance perspective, but not from the management perpective"

---

## Scenario:

A company has a single network: **10.0.0.0/16** with **thousands of devices** — employees, printers, servers, IoT devices — all connected in one big flat network without any subnetting.

## What Happens?

1. **Management Nightmare:**
    
    - **Troubleshooting is difficult:** When a network issue arises, admins must sift through thousands of devices to identify the problem source.
        
    - **IP conflicts and tracking issues:** Without subnetting, IP address management becomes chaotic, leading to frequent conflicts and difficulty tracking devices.
        
2. **Security Risks:**
    
    - **No isolation:** If one device is compromised (e.g., malware on an employee laptop), the attacker can potentially reach any other device on the network without restriction.
        
    - **No granular control:** Access policies can only be applied globally, making it impossible to restrict sensitive resources from general users.
        
3. **Performance Degradation:**
    
    - **Broadcast storms:** Broadcast traffic (like ARP requests) floods the entire network, consuming bandwidth and slowing down all devices.
        
    - **Network congestion:** Large numbers of devices competing in one broadcast domain cause delays and packet collisions.
        
4. **Scalability Issues:**
    
    - As the company grows, the flat network becomes increasingly unstable and unmanageable. Adding new devices or departments requires manual IP assignment and complex firewall rules that are hard to maintain.

--- 