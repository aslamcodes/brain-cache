---
tags:
type:
date: 2025-08-24
done: false
---
A Typical IO operation
- The [[device driver]] loads the [[device controller]]'s registers
- [[device controller]] examines the registers
- [[device controller]] takes the action
- [[device controller]] loads its local buffer
- [[device controller]] ***informs*** the device driver after being done
- [[device driver]] informs the OS with possibly the 
	- data
	- pointer to the data
	- (non-io operation) message

