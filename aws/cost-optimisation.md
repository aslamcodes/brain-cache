# AWS Compute Optimiser
- Analyes historical data and offer guidance for EC2, EBS, Lambda functions

# AWS Cost Allocation Tags
- Organising pricing and billing for Billing on tag basis

# Cost Management Tools
- Cost Explorer 
    - Helps to understand where is our money going lol?
    - Has the cost data of past 13 months, and forecasts too
    - Helps us to identity cost problem areas
    - Service usage statistics

# Cost and Usage Report
- Billing reports to s3
- cost break down by hour, day, month, product, resource tags
- Report can be updted 3 tiems a day

# Price list
- Allows to query pricing of AWS services
- Alerts can be setup when prices changes
- Price List Service API - JSON
- Price List API - HTML/Bulk

# EC2 Pricing

## Pricing Plans
On demand: Standard rate, great for short term, test workloads
Reserved: 1 or 3 year commitment for discounts, till 75%
Spot: Can be terminated at any time, but 90% discounts

Dedicated Instances: No sharing with others
Dedicated Hosts: Get your own server

Savings Plan: Dollars per hour, with 1 or 3 year commitment

## EC2 Placement Groups
You cannot control which AZ your Ec2 instances would get launched, usually. But with placement groups you can control, predefined strategies that AWS provided.
- Partition: 
- Spread: Ensures the instances are not located in same physical hardware
    - Spread levels: Hosts (only on outposts) and Racks
- Cluster: Group instances in a az, for low latency benefits
