---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Transition
- Move objects between storage classes

Expiration Action
- Explire multi part uploads if they are incomplete
- Expire older version of objects after some time
- Expire after a particular time

Rules can be targeted to a prefix

# Configuring a Lifecycle rule
These are the actions we can configure
- Transition current versions of objects between storage classes
- Transition noncurrent versions of objects between storage classes
- Expire current versions of objects 💀
- Permanently delete noncurrent versions of objects
- Delete expired object delete markers or incomplete multipart uploads

Each of these requires a configuration if opted for

