---
tags:
type:
date: 2025-11-02
done: false
---
## Ephemeral blocks
- Ephemeral blocks are block that can be used to generate ephemeral values that's not going to be stored on state files, and can be passed on to the resources that terraform manages. 
- Example - You are creating a database with a password, you can use ephemeral block to create the credentials and pass it to the database. 
- However if you feel like the created value is required maybe in future, you can store it in a intermediate service, like secrets manager or vaults

## Write only attributes
- Terraform "writes" to the managed resource, but don't read or store it

> [!NOTE] 💡 Best practice
> Using Ephemeral blocks to create values and store it in intermediate storages using write only attributes and to the intended resource

https://developer.hashicorp.com/terraform/language/manage-sensitive-data/write-only#examples

# Versioning
- Terraform stores version in state, without that terraform's lifecycle wouldn't know about any changes