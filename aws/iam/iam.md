---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

---
dg-publish: true
---
# Policy Evaluation
Stage 0: Explicit Deny, in any policies
1. If there's a explicit deny anywhere, its denied (Deny Overide any Allow)

Stage 1: SCP
1. If Pricipal is part of a SCP, There should be an Allow, in the policy
2. If there isn't an SPC, goest to next

Stage 2: Resource based policy
1. If the resource based policy allow, allows
2. If not, go to next stage

Stage 3: Identity based policy
1. Allows, Then moves to next stage..? Since 

If identity based policy, resource based policy, SCP aren't allowing, so far, Then deny is given
BUT, if the resource based policy allows the action, then stages aren't progressing

> If the Identity policy allows, then session policy and permission boundaries are checked before allowing the actions

Session policies are just what you give to ever narrow your permission when you assume a role

# Permission Boundary
https://medium.com/cloudandthings/aws-session-policies-923a8eaff0ea

Sort of a boundary, which you can never pass, even if you have policies

