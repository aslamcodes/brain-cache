EC2, ELB, Route53, RDS, Elasticache and its PAAS kinda thing

Worker Tier, load balanced with SQS queues, as EC2 instances pull its job
Web Tier, load balanced with request, as requests are forwarded to ec2 instances for processing