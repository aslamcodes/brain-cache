---
tags:
type:
date: 2025-09-10
done: false
---
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