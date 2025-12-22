---
tags:
type:
date: 2025-12-22
done: false
---
However, thread locals is probably an old way of doing it. 

The idea is theadlocals pass data implicitly

more like

```go
func someBusinessLogic() {
	userId = RequestLocal.user.get()
}
```

The thread runtime injects the threadlocals, and not explicit about it as its not clear, you might get null values if the parent code doesnt’ set it up correctly.

if not handled properly, thread reuse can happen, that is local value set in a thread for a request might get used again for other, anddthis is a big business issue. One should reset the thread local after a request as threads often come from a single pool of threads

Langauges Improved on this to prevent this from happening

```
Java: ScopedValue (Project Loom)
Python: contextvars
Kotlin: CoroutineContext
JavaScript: AsyncLocalStorage
```
