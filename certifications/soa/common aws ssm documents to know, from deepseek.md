---
tags: 
type: 
date: 2025-07-22
done: false
---
### 🔧 **Core SSM Documents by Exam Domain**
#### **1. Domain 1: Monitoring, Logging & Remediation** 47
- **`AWS-RunPatchBaseline`**:  
    Applies OS patches using predefined baselines (critical for compliance).
- **`AWS-GatherSoftwareInventory`**:  
    Collects software inventory for audits and compliance checks.
- **`AWS-ExecuteAutomation`**:  
    Triggers automated remediation workflows (e.g., in response to CloudWatch alarms).
#### **2. Domain 2: Reliability & Business Continuity** 410
- **`AWS-CreateImage`**:  
    Creates AMIs for backups/disaster recovery.
- **`AWS-FailoverEC2Instance`**:  
    Automates failover across AZs during outages.
- **`AWS-RestoreEC2Instance`**:  
    Recovers instances from snapshots for business continuity.
#### **3. Domain 3: Deployment, Provisioning & Automation** 47
- **`AWS-RunAnsiblePlaybook`**:  
    Integrates Ansible for configuration management.
- **`AWS-ConfigureAWSPackage`**:  
    Installs/updates software packages (supports Linux/Windows/macOS).
- **`AWS-UpdateSSMAgent`**:  
    Ensures the SSM Agent is current (vital for seamless operations).
- **`AWS-StartAutomationExecution`**:  
    Orchestrates complex deployments (e.g., rolling updates).
#### **4. Domain 4: Security & Compliance** 410
- **`AWS-ResetAccess`**:  
    Recovers lost instance access by resetting security groups/VPC configurations.
- **`AWS-RunSecurityBaseline`**:  
    Applies security benchmarks (e.g., CIS standards).
- **`AWS-DisableOrTerminateEC2Instance`**:  
- **`AWS-RunShellScript`**:  
    Troubleshoots network issues (e.g., DNS, routing) via ad-hoc commands.
- **`AWS-StartSession`**:  
    Securely access instances via SSH/RDP (replaces bastion hosts).
#### **6. Domain 6: Cost & Performance Optimization** 4
- **`AWS-StopEC2Instance`** / **`AWS-StartEC2Instance`**:  
    Schedules start/stop cycles to reduce costs.
- **`AWS-RunInspecChecks`**:  
    Audits resource configurations for efficiency gaps.