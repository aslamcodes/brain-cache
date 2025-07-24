---
tags: 
type: 
date: 2025-07-23
done: false
---
# Enterprise / HCP Terraform
> [!NOTE] [Workspace seems to be entirely different than community ones](https://developer.hashicorp.com/terraform/cloud-docs/workspaces#workspace-contents)
While workspaces in the Community and HCP Terraform versions of Terraform serve the same purpose of managing multiple environments and configurations, there are differences in how they are implemented and accessed.
- HCP Terraform agents are primarily responsible for executing Terraform plans and applying changes to infrastructure. They act as the bridge between the HCP Terraform service and the target infrastructure, ensuring that the desired state of the infrastructure is achieved based on the Terraform configuration.
- Workspaces can be swithced via the web interface
- HCP terraform can be managed via CLI but requires a API token
- HCP terraform's speculative plan
	- Don't need state locks as `plan`
	- Shows possible changes for code review
	- Triggered in PR based workflow
- Sentinel policy HCP terraform
	- You write policies based on [[lua language]] which govern the terraform runs to prevent any unintended behaviours
	- If policy fails, apply is blocked
- You can migrate from terraform cli (community) to HCP terraform, by doing so the terraform workspace version will be whatever your local binary is. However you can hint on `terraform` block
- The `terraform login` command obtains an API token for HCP Terraform, Terraform Enterprise, or other host that offers Terraform services.
- [Environment variables](https://developer.hashicorp.com/terraform/cli/config/environment-variables#tf_in_automation)
	- `TF_LOG`: `trace`, `off`
	- `TF_LOG_PATH`: `./file.log`
	- `TF_INPUT`: `0 or 1 // Turns of input prompts`
	- `TF_VAR_name`
	- `TF_WORKSPACE`
- HCP terraform workspace
- variable set is like db parameter groups