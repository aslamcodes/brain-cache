---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

#iam
> Access a S3 bucket created in one account from other

- S3 bucket's account - create a role with trusted policy as accessor account
- So anybody in accessor account can access bucket
- If to restrict access in accessor account, identity level policy can be used to restric

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": "sts:AssumeRole",
      "Resource": "arn:aws:iam::<PROD_ACCOUNT_ID>:role/ProdAccessRole"
    }
  ]
}

```