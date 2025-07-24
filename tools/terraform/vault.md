---
tags: 
type: 
date: 2025-07-23
done: false
---
# Vault
- The Terraform provider for Vault does not inherently provide the ability to mask secrets in the state file. It is important to handle sensitive information securely in Terraform configurations.
```HCP
variable "db_password" {
  type      = string
  sensitive = true
}

# or 

data "aws_ssm_parameter" "db_password" {
  name = "/myapp/db/password"
  with_decryption = true
}
```
