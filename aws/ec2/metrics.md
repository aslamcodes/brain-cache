Basic monitoring - metrics 5 minute interval
Detialed Monitoring - metrcis 1 minute interval
Metrics - CPU, Network, Disk and Status check metrics
## Custom metrics
Basic - One minute
High resolution - one second
EC2 instance should have an IAM role with the permission to push thr metrics
## EC2 Included Metrics
- CPU: CPU utilisation + Credit Usage / Balance
- Network: In/out
- Status Check: Health or not
    VM (1/3)
    Underlying hardware check (2/3)
    EBS check (3/3)
# Detailed Monitoring
- To enable detailed monitoring. 
- Go to ec2 -> monitoring -> Manage detailed monitoring -> Enable detailed monitoring

# Unified Cloudwatch agent
- For virtual servers and on prem servers
- Get additional system logs and metrics
- The agent can be configured via SSM parameter store
- Correct IAM permissions should be there
## Configuring Agent
- Install agent
- Run the wizard
	- Choose OS
	- Ec2 or On prem
	- StatD demon
	- User space
	- interval
- The wizard will generate a json, which can be stored to ssm parameter store given the necessary permission, and can be loaded back into a fresh VM with fetch-config options via a file or ssm parameter store
## Procstat plugin 
- Collect metrics for individual processes (process + stats)
- Select which process to monitor, via pid, name, pattern
- Metrics will have prefix prostat
- CollectD
- Monitor Host metrics
- Core level metrics
- Ec2 dimension
- High res metrics
- and a lot
- Generates a json 

