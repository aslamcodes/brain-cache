---
tags:
type:
date: 2025-09-07
done: false
---
Arrays double its size when length of the slice exceeded the capacity of the underlying array. Essentially its a new array with elements copied from the old array into the new array. so appends are obviously linear time

Preallocating with make optimizes and potentially avoid reallocation when performance is crictical

```go
make([]T, length, capacity)
```