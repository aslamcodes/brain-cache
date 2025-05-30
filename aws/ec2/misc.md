## Shutdown Behaviour

- Advanced settings -> shutdown behaviour (Terminate / Stop) Stop is default

- If you shutdown from instance, the instance terminates
- If via console, it stops

## Termination Protection
- Protection from accidental termination only from api actions. Not if its done from the OS

## EC2 Placement Groups
You cannot control which AZ your Ec2 instances would get launched, usually. But with placement groups you can control, predefined strategies that AWS provided.
- Partition: 
- Spread: Ensures the instances are not located in same physical hardware
    - Spread levels: Hosts (only on outposts) and Racks
- Cluster: Group instances in a az, for low latency benefits
