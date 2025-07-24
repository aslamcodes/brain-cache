---
tags: 
type: 
date: 2025-07-23
done: false
---
- `tf fmt -recursive`
- `tf output` outpust
- `tf modules -json` retrieves list of modules used by the configuration
- `terraform version` not `terraform --version`
- `terraform show`
	- Provides humand readable output from a state file or plan file
	- `-json` 
- `terraform state show [options] address`
	- Specific resource in the statefile
- `terraform refresh`
	- reads from remote
	- deprecated
		- `terraform plan -refresh-only` same as `terraform refresh` and the options are pretty much the same
```
terraform apply -refresh-only -auto-approve // automatically updates the state file without prompting
```
- `terraform import`
	- Manually setup a resource block to import resources into
	- and then 
- `terraform force-unlock` unlocks the state file by force
	- `-force` don't ask for confirmation
- terraform apply
	- `-replace=aws_instance.web` marks an resource for replacement, forces replacement of a resource
- terraform destroy
	- speculative plan `terraform destroy -plan`
	- alias for `terraform apply -destroy`, doesn't plan file argument
	- `-target` option targets a specific resource 
		- `tf destroy -target=aws_instance.example`
- `terraform state` command can be used to modify the state
	- also show, list, pull
	- `mv` 
		- `terraform state mv aws_s3_bucket.data-bucket aws_s3_bucket.prod-encrypted-data-s3-bucket`
		- Moves the the existing state object to the new local name specified, ensuring that Terraform does not replace the resource.
- this is how'd you save plan to a file `terraform plan -out=bryan`
	- `terraform apply 'bryan'`
- `terraform get` is something that you'd wanna use if you JUST want to pull new modules. But `terraform init` can do it by self.
- `terraform plan`
	- `-refresh-only` refreshes the state file, matches the infra
- `terrafomrm workspace`
	- `terraform workspace new` command will create a new workspace
	- installs separate cache for plugins and modules
	- common use case
		- would be to use different workspace for different environment such as prod and non prod env
		- would be use separate workspace for separate branches
	- for community version stores it on 
		- `terraform.tfstate.d/<workspace name>`
- `terraform console`
	- Launches a interactive console
	- Acquires a state lock as it reads from state
	- Remote state can aslo be read
