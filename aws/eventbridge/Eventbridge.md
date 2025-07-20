---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

- Event source - aws services, eventbridge partners
- AWS service/ Partner - choose the source
- Event type - Each event provider (aws service / partner) have multiple event types

formerrly Cloudwatch events
used to schedule crons, react to event via trigger that transforms input and triggers lambda, SNS, SQS ...,

![[Udemy ScreenShot 2025-07-01 11-13-01.jpeg]]

# Event buses
Event bridge has a **default event bus** for aws services
**Partner event bus**, AWS partners can send directly into a partner event bus
**Custom event bus** for custom apps

![[Udemy ScreenShot 2025-07-01 12-13-48.jpeg]]

Events can be archived for set of perior or indeinitley, 
archived events can be replayed

# Schema registry
what is this? all types of events recorded in an account and code bindings can be downloaded
![[Screenshot 2025-07-01 at 12.17.45.png]]

# resource based policy
- Permission for specific event bus
- allow/deny events from other accounts
![[Udemy ScreenShot 2025-07-01 12-17-20.jpeg]]

# rule pattern matching
https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-pattern-operators.html

# Input transformer
- Transform your event towards a downstream application that expects in a particular manner
```json
  {
    "AutomationParameters": {
      "ImageBuilderName": "${aws_appstream_image_builder.main2.name}",
      "ImageOutputPrefix": "${local.version}",
      "PackageS3Prefix": "${local.product}",
      "SSMParameterName": "${aws_ssm_parameter.trigger_ssm_value.name}"
    }
  }
```

![[Screenshot 2025-07-01 at 14.53.29.png]]