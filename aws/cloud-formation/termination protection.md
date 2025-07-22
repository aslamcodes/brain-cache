---
tags: 
type: 
date: 2025-07-22
done: false
---
- Prevents stacks from accidentally deleted
- If deletion triggered, the status and resources remains unchanged
- Stacks expect `DELETE_IN_PROGRESS` and `DELETE_COMPLTE` can be enabled with termination protection
- Disabled by default
- Propagates into nested stacks also and all same properties applies to the nested stack also
- 