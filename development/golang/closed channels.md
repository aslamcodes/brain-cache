---
tags:
type:
date: 2025-09-09
done: false
---
```go
func () {
	ch <- 5
	close(ch)
}
```

```go
// Check if a channels is closed
val,  is_closed := <- ch
```

If the channel is closed, any more receives will provided with zeros

> Closing a channel is particularly useful, when ranging over it on a loop. 