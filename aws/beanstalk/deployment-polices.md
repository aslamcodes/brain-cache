---
tags: 
type: 
date: 2025-07-20
done: false
---
- **Rolling deployments** replace instances in batches, so some serve the old version while others get updated — **no additional cost**.
- **Rolling with additional batches** temporarily launches extra instances — **incurs additional cost**.
- **Immutable** creates a full new environment — **highest cost**.
- **All at once** replaces everything at once — doesn't meet the requirement of serving both old and new versions during deployment.

You’d choose **“Rolling with additional batches”** if:
- You want **zero downtime** (extra capacity handles traffic during replacement).
- You need to **maintain full capacity** while updating.
- You’re okay with **temporary cost increase** for smoother, safer deployments.