---
tags: 
type: 
date: 2025-08-16
done: false
---
Central Security tool to manage security **Across Accounts**. Integrates [[All Security Services|various aws security services]] and other integrated partner services into one dashboard, making it easier to view status and take actions.

[[config]] must be enabled before using security hub. As security hub uses config to do gather findings [1](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-setup-prereqs.html#:~:text=Security%20Hub%20Cloud%20Security%20Posture%20Management%20(CSPM)%20uses%20AWS%20Config%20rules)[2](https://docs.aws.amazon.com/securityhub/latest/userguide/controls-config-resources.html#:~:text=some%20controls%20use%20service%2Dlinked%20AWS%20Config%20rules). Its not to say, security hub solely depends on config, instead config is a critical data source for security hub, than other resources

A Delegated admin account has to be set up that will take care of monitoring several AWS accounts.

![[security hub-1755338481676.png]]
