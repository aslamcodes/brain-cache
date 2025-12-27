---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
If you are deploying stacks accross regions, if you stack has IAM resources, it would result in unintentional behaviour, such as some resource arent' created 

If there's any errors, that stack would ROLLBACK and no resources wouldn't be there if there's a ROLLBACK policy
