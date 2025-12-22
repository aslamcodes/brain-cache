---
tags:
type:
date: 2025-09-10
done: false
---
# Context
All the requests handled by go servers, might be handled by multiple go-routines. each of the go routines must be aware of request scoped variables such as cancellation.

```
// A Context carries a deadline, cancellation signal, and request-scoped values
// across API boundaries. Its methods are safe for simultaneous use by multiple
// goroutines.
type Context interface {
    // Done returns a channel that is closed when this Context is canceled
    // or times out.
    Done() <-chan struct{}

    // Err indicates why this context was canceled, after the Done channel
    // is closed.
    Err() error

    // Deadline returns the time when this Context will be canceled, if any.
    Deadline() (deadline time.Time, ok bool)

    // Value returns the value associated with key or nil if none.
    Value(key interface{}) interface{}
}
```

- The `Done` is receive only for the same reason that there is not cancel function, a context should only be cancelled by the parent
- `Deadline()` method determines that a function should start work at all? More on this later
- `Value` is for use by multiple goroutines. But are they secured by locks?
- Deriving a context from another context forms a tree, cancelling one context cancels till leafs, and every context has **background context** which would never be cancelled
		- WithCancel(parent_ctx, cancel_func) (ctx, cancelfunc) or withTimeout(parent_ctx, timeout) (ctx, cancelfunc)
# Creating contexts
The context object can be created in three ways
1. basic
2. preemptive cancellation
3. deadline cancellation (timeout, deadline)

**Basic**
```go
ctx := context.Context(context.Background())
```
**Preemptive**
![[The Context-1766428513852.png]]
There are cases when a requests that gets handled by multiple go routine making another subset of requests. If one of them fails rendering that you wouldn't be able to return a valid result, there's no point in continuing, you can just kill the context by cancelling

> [!NOTE] Cancel your Contexts
> Once you're done with you contexts, just cancel them. Failing to do so results in resource leaks, subtle increase in memory resources and goroutines leaks
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
# Related Documents
[[context.Context() integration planning]]