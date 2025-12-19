---
tags:
type:
date: 2025-12-19
done: false
---
- Memory leak - memory gets clogged up and can't flow freely
- Goroutine leak - goroutines pile up like a clogged drain
- Connection leak - connections accumulate and block new ones

The term leak doesn't sound intuitive for me for a long time until now. 

It is often mean when you hold resources without closing, its a Leak. I wondered why they named this term Leak, as we are not leaking anything, we are blocking. Clogging could've been a better choice.

However, when see from the POV of the entire system, you're program is holding up resources from available pool of resources (memory, fd, threads...) - you're essentially leak-ing the pool, hence the term leaking. 