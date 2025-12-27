---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

#elastic-beanstalk 
Environment
- App + configuration + infra resources.

Application Version
- A deployable archive (ZIP, WAR, etc.).

Environment Tier
- Web Server: HTTP requests (with ELB).

Worker: Background jobs (uses SQS).

Configuration Files (.ebextensions)

For customizing resources and software on 

> If you would need to change something to the components or installing via ec2 instances will not persist, we should do it on the eb configuration files `.ebextensions/autoscaling.config` which is just a yaml file and probably deploy as a new version 

```
~/workspace/my-app-v1.zip
|-- .ebextensions
|   |-- environmentvariables.config
|   `-- healthcheckurl.config
|-- index.php
`-- styles.css
```

