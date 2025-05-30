# AWS Datasync
- On prem to AWS, needs a agent
- AWS to AWS

- S3, FSx, EFS

Replciation can be scheduled: weekly, daily, hourly

Preserve file meta data (SMB, POSIX)

AGent can go up to 10Gbps bandwidth

# AWS Backup
- Centrally manage backpus for Most of AWS services
- EC2, EBS, S3, RDS, Aurora, Dynamo DB, Document DB, Neptune, Fsx, Fsx lustre, EFS, Storage Gateway

- Support cross region backups for DR

Backup Policies -> Backup plan
    - Schedule
    - Backup Window
    - Transition to Cold storages
    - Retentions period

Backup Vault -> Backups init would never get deleted
