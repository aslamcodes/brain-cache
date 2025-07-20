---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---


| **AWS Component**                   | **Function**                               | **TCP/IP Layer**                   | **OSI Layer(s)** |
| ----------------------------------- | ------------------------------------------ | ---------------------------------- | ---------------- |
| **EC2**                             | Compute VM                                 | Transport / Internet / Application | Layers 3–7       |
| **S3**                              | Object storage                             | Application                        | Layer 7          |
| **EBS**                             | Block storage                              | Application                        | Layer 7          |
| **EFS**                             | File storage (NFS)                         | Application                        | Layer 7          |
| **VPC**                             | Virtual network                            | Internet / Network                 | Layers 2–3       |
| **Subnet**                          | IP CIDR division                           | Internet / Network                 | Layer 3          |
| **Security Group**                  | Stateful firewall                          | Transport                          | Layer 4          |
| **NACL**                            | Stateless firewall                         | Network / Transport                | Layers 3–4       |
| **Route Table**                     | Routing decision                           | Internet / Network                 | Layer 3          |
| **Internet Gateway (IGW)**          | VPC to internet access                     | Internet                           | Layer 3          |
| **NAT Gateway/Instance**            | Outbound internet for private subnets      | Internet                           | Layer 3          |
| **Elastic IP (EIP)**                | Static IPv4                                | Internet                           | Layer 3          |
| **Elastic Load Balancer**           | Traffic distribution                       | Application / Transport            | Layers 4, 7      |
| – Application LB (ALB)              | HTTP/HTTPS load balancing                  | Application                        | Layer 7          |
| – Network LB (NLB)                  | TCP/UDP load balancing                     | Transport                          | Layer 4          |
| – Classic LB (CLB)                  | Legacy support                             | Application / Transport            | Layers 4, 7      |
| **Route 53**                        | DNS, routing                               | Application                        | Layer 7          |
| **IAM**                             | AuthN/AuthZ                                | Application                        | Layer 7          |
| **CloudFront**                      | CDN, content caching                       | Application                        | Layer 7          |
| **WAF**                             | Web Application Firewall                   | Application                        | Layer 7          |
| **Shield**                          | DDoS protection                            | Application / Transport            | Layers 4, 7      |
| **Lambda**                          | Serverless compute                         | Application                        | Layer 7          |
| **API Gateway**                     | API management                             | Application                        | Layer 7          |
| **Elastic Beanstalk**               | PaaS deployment                            | Application                        | Layer 7          |
| **App Runner**                      | App deployment for containers/web services | Application                        | Layer 7          |
| **CloudWatch**                      | Monitoring and logging                     | Application                        | Layer 7          |
| **CloudTrail**                      | API activity logging                       | Application                        | Layer 7          |
| **Direct Connect**                  | Dedicated network link                     | Network Interface                  | Layers 1–2       |
| **Site-to-Site VPN**                | Encrypted VPC connection                   | Internet                           | Layer 3          |
| **Transit Gateway**                 | Central routing hub                        | Internet                           | Layer 3          |
| **VPC Peering**                     | Private VPC connectivity                   | Internet                           | Layer 3          |
| **PrivateLink**                     | Private service access over ENI            | Internet / Application             | Layers 3, 7      |
| **Endpoint (Interface/Gateway)**    | VPC to AWS service access                  | Internet / Application             | Layers 3, 7      |
| **Elastic Network Interface (ENI)** | Virtual NIC                                | Network                            | Layer 2          |
| **MAC Address**                     | Unique hardware identifier                 | Network                            | Layer 2          |
| **ARP**                             | IP ↔ MAC mapping                           | Network                            | Layer 2/3        |
| **DHCP Options Set**                | IP assignment options                      | Application                        | Layer 7          |
| **CloudFormation**                  | IaC orchestration                          | Application                        | Layer 7          |
| **Systems Manager (SSM)**           | Remote management                          | Application                        | Layer 7          |
| **CodeDeploy / CodePipeline**       | CI/CD                                      | Application                        | Layer 7          |
| **Kinesis / MSK**                   | Streaming data platforms                   | Application                        | Layer 7          |
| **SNS / SQS / EventBridge**         | Messaging/Eventing                         | Application                        | Layer 7          |
| **AWS IoT Core**                    | IoT messaging                              | Application                        | Layer 7          |
