---
tags:
type:
date: 2025-11-03
done: false
---
Terraform manages a radix tree of commands as its abstracted away in [cli module](https://github.com/hashicorp/cli) that terraform maintains. 

when `terraform apply` is run, the apply is subcommand fetched from the library of commands that terraform maintains in [terraform/commands.go](https://github.com/hashicorp/terraform/blob/main/commands.go)
