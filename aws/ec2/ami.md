# AMI - Amazon Machine Image
AMIs is built specific to region. So different AMI ids.

## **AMIs are regional because**
Data locality: AMIs are stored in **Amazon S3** (since AMIs are snapshots) within a specific region for performance and compliance.
Network efficiency: Launching instances from local AMIs reduces cross-region latency and costs.
Service isolation: AWS services operate independently per region for high availability and fault isolation.
Compliance & sovereignty: Regional control helps meet legal/data residency requirements.

## Building AMI from EC2
- Launch instance
- Configure
- Stop 
- Take AMI (Snapshots internally)
    - Actions -> Images and Templates -> Create an Image

### No Reboot AMI
- Create AMI without rebooting
- 💡AWS Backup plans uses no-reboot internally

[[ami-no-reboot]]

## Migrating EC2 instance between AZs
- Take AMI from Source
- Share AMI
- Launch Ec2

### Cross Account AMI sharing
- If AMIs are shared cross account, with encryption, the CMKs has to be also shared
- Uncrypted volume can shared. 
- 🚨Same as EBS snapshot

### Cross Account AMI Copying
- Copying leaves us with no ownership?

https://repost.aws/questions/QUtlFiTOMNRn-xAk6uJnHnwg/shared-vs-copy-ami

# EC2 Image Builder
- Automate the creation of AMIs
- Pipelines, Components, Recipes

- EC2 Image builder -> install -> AMI -> Tests -> Distributions

