---
tags:
type:
date: 2025-12-22
done: false
---
# The problem

# Background knowledge
The context object can be created with three ways
1. basic
2. preemptive cancellation
3. deadline cancellation (timeout, deadline)

**Basic**

```go
ctx := context.Context(context.Background())
```

**Preemptive**
```go
ctx, cancel := context.WithCancel(context.Backgroun()) 
defer cancel()
```
**deadline cancellation**
```go
ctx, cancel := context.WithTimeout(context.Background(), 5 * time.Second)
defer cancel()
// or
ctx, cancel := context.WithDeadline(context.Background(), time.Now())
defer cancel()
```

# Integration Planning
- The base context is going to be non cancellable, and other time bound and cancellable contexts will be derived from it and passed downwards
- For appstreamfile, which is based on variety of IO calls (network, disks, other executables), should the component that performing the operation may have timeouts, ie components interactive with IO boundary or the root context is to have a universal timeout and configurable by the user 

