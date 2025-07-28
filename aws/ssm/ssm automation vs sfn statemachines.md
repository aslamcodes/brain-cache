---
tags: 
type: 
date: 2025-07-27
done: false
---
> [!NOTE] Simple Crossover
> Step function and lambda ~ SSM automation and SSM RunCommand

> SSM Automation is designed to work more on your EC2 instances, doing stuff like patching, rebooting servers, upgrading AMIs, etc, with some resource actions tailored to that job. I never actually used it, but it seems to be based on the same Step Functions engine or something really similar.
>
> Step Functions is the OG, it will orchestrate your states, you can bring info from one state to the other, have state machines running for a year, run your state machine behind an API gateway, etc.
>
> I would user SSM Automation if I can benefit from some of the SSM specific actions:
>
> https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-actions.html
>
>Step Functions has some cool tricks as well, like distributed map, parallel execution, etc.
>
> - A Reddit user