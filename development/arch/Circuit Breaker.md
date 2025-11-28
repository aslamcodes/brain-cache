---
tags:
type:
date: 2025-09-07
done: false
---
The core job a architect in a company would be to analyze the impact of a downtime of a particular design

The calling service will have limited thread pool, when a callee service is down due to some reason, the caller service will keep on requesting, which in turn exhausts the thread pool, resulting in the failure of caller service, and cascading to the whole systems failing. 

To prevent that from happening, the failed system for the duration until its recovered will return a fallback message or hardcoded value, so that the cascading will be prevented.