---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

> Way to know if the cfn init worked as expected
- The cfn-signal command executes right after cfn-init **conventionally**
- **Wait Condition** is required which makes the template wait until it receives the signal from cfn-signal. For this, we would need to attach a creation policy
```yaml
CreationPolicy:
	ResourceSignal:
		Timeout: PT5M
		Count: 1 // How many signals are you waiting

```

# Wait Condition Sample
```
Resources:
  MyInstance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: ami-123456
      InstanceType: t2.micro
      UserData:
        Fn::Base64: !Sub |
          #!/bin/bash
          yum install -y httpd
          /opt/aws/bin/cfn-signal -e 0 --stack ${AWS::StackName} --resource MyWaitCondition --region ${AWS::Region}

  MyWaitHandle:
    Type: AWS::CloudFormation::WaitConditionHandle

  MyWaitCondition:
    Type: AWS::CloudFormation::WaitCondition
    DependsOn: MyInstance
    Properties:
      Handle: !Ref MyWaitHandle
      Timeout: 300
      Count: 1

```
# CreationPolicy sample
```yaml
Resources:
  WebServer:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: ami-123456
      InstanceType: t2.micro
      UserData:
        Fn::Base64: !Sub |
          #!/bin/bash
          yum install -y nginx
          systemctl start nginx
          /opt/aws/bin/cfn-signal -e 0 --stack ${AWS::StackName} --resource WebServer --region ${AWS::Region}
    CreationPolicy:
      ResourceSignal:
        Timeout: PT10M

```
![[Udemy ScreenShot 2025-07-03 15-25-08-2.jpeg]]

# if failed
- Analyse the log file /var/log/cfn-inti or cloud-init.log
- Must have internet connectivity NAT/IGW or VPCe
- Cloud formation helper scripts might not get installed
- If rollback on failure is enabled, the instance might get deleted, which would be harder for debugging purposes
