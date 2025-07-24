---
tags: 
type: 
date: 2025-07-23
done: false
---
- [ states can be encrypted if you configure your backend, if s3 such as](https://developer.hashicorp.com/terraform/language/backend/s3)
	- Uses backed enabled encryption of s3
- The implicit dependency in on the `web_server` as it uses the eip.
```HCP
resource "aws_eip" "public_ip" {
    vpc      = true
    instance = aws_instance.web_server.id
}
 
resource "aws_instance" "web_server" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  depends_on    = [aws_s3_bucket.company_data]
}
```
- The resource type is identified by "resource" word 🙄
```hcl
resource "aws_instance" "db" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
```
- `terraform import` only import resources into the state file, not generate any configuration, you'd need to use `import` block **instead** to generate the accompanying configuration 
	- `import block` vs `import command`
		- Declarative vs imperative

- `list[0]` is same as `element(list, 0)
- terraform recommends 2 spaces on each nested levels
- terraform is an immutable language
	- mutable in the sense the how we use configuration management tools, that updates in place, but sometimes some components fail due to arbitrary reasons resulting in a half ass state
	- https://youtu.be/II4PFe9BbmE
	- But terraform is immutable, Which needs creation of new version totally.
	- https://www.hashicorp.com/en/tao-of-hashicorp
- terraform recommends 2 spaces on each nested levels
- `splat` expression
```
[for o in var.list : o.id] 
var.list[*].id # splat
```
- [Expressions](https://developer.hashicorp.com/terraform/language/expressions)
- [Dynamic block acts as a for expression but for nested blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks)
```
resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "tf-test-name"
  application         = aws_elastic_beanstalk_application.tftest.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.11.4 running Go 1.12.6"

  dynamic "setting" {
    for_each = var.settings
    content {
      namespace = setting.value["namespace"]
      name = setting.value["name"]
      value = setting.value["value"]
    }
  }
}
```
# Backend config
```hcl
bucket         = "my-terraform-state-bucket"
key            = "envs/dev/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "terraform-locks"
encrypt        = true
```

```
# can be specified here
terraform init -backend-config=backend-config.hcl
```