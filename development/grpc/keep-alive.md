---
tags:
type:
date: 2025-09-06
done: false
---
**Use cases**
- Prevent connection closing by load balancers due to idle connections
- Detect client/server down
**Considerations**
- Increased chances of DDoS attack to the server
	- Keep alive must be below one minute as it prevents potential DDoS