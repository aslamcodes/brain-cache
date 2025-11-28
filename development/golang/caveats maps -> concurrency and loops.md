---
tags:
type:
date: 2025-09-10
done: false
---
https://go.dev/blog/maps

**Concurrency**
> [Maps are not safe for concurrent use](https://go.dev/doc/faq#atomic_maps): it’s not defined what happens when you read and write to them simultaneously. If you need to read from and write to a map from concurrently executing goroutines, the accesses must be mediated by some kind of synchronization mechanism. One common way to protect maps is with [sync.RWMutex](https://go.dev/pkg/sync/#RWMutex).

**loops**
> When iterating over a map with a range loop, the iteration order is not specified and is not guaranteed to be the same from one iteration to the next. If you require a stable iteration order you must maintain a separate data structure that specifies that order. This example uses a separate sorted slice of keys to print a `map[int]string` in key order: