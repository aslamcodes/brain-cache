### 🔧 Core Functions:
- `!Ref` → get value of param or resource  
- `!GetAtt` → get attribute (e.g. `!GetAtt EC2Instance.PublicIp`)  
- `!Sub` → string interpolation (`${}`)  
- `!Join` → concat strings  
- `!If`, `!Equals`, `!Not`, `!Or`, `!And` → conditions  
- `!Select`, `!Split`, `!FindInMap` → array/map helpers  

### 🔄 Pseudo Parameters:
- `${AWS::Region}`  
- `${AWS::AccountId}`  
- `${AWS::StackName}`  
- `${AWS::Partition}`  
- `${AWS::NoValue}` → used to remove a property conditionally  

### 🧩 Intrinsics & Helpers:
- `Mappings` → key-value lookup table  
- `Conditions` → used to control resource creation  
- `DependsOn` → control resource dependency  
- `Metadata` → for tooling (e.g., `cfn-init`)  
- `CreationPolicy`, `UpdatePolicy`, `DeletionPolicy` → lifecycle control  

### 📦 Template Sections:
- `Parameters` → user inputs  
- `Resources` → actual AWS stuff  
- `Outputs` → expose values  
- `Mappings`, `Conditions`, `Metadata`, `Rules`  

Master these, and you're 90% CloudFormation-ready.