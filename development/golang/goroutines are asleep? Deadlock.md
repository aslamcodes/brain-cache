---
tags:
type:
date: 2025-09-09
done: false
---
Deadlock in GO can happen when All go routines are blocked by something (Locks, channels or IO)

**Examples**

A very simple example would be to 

```go
func main () {
	select {}
}
```
Here, select has no cases, no timers. The `main` goroutine is waiting on other goroutines to unblock it. The runtime doesn't see anyother goroutine running to unblock this, hence the runtime detects a deadlock and panics

**with context.background**

```go
func main() {
	<-context.Background().Done()
}
```
The `Done` channel is a `nil` channel for context.Background, hence 
