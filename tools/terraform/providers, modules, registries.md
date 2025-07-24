---
tags: 
type: 
date: 2025-07-23
done: false
---
- registries support versioning, local path, git won't support versions
- private registry
	- private registry moudules can be sourced strings of the form `<HOSTNAME>/<NAMESPACE>/<NAME>/<PROVIDER>`
	- https://developer.hashicorp.com/terraform/language/modules/sources
- publishing to registry
	- must be on public repo
	- must use tags for versioning, in this format `x.y.z` optionally prefixed with `v`
	- repo name format `terraform-<provider>-<name>`
	- Secondary providers are allowed but don’t go in the repo name.