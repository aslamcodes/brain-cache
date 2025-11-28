---
tags:
type:
date: 2025-09-09
done: false
---
Deadlock in GO can happen when All go routines are blocked by something (Locks, channels or IO)

❌ Not works
```
package main

import "fmt"

func main() {
	ch := make(chan int) // channels without buffer
	go func(ch chan int) {
	}(ch)

	ch <- 1 // blocks
	fmt.Println(<-ch) 
}

```

Channels that have no buffer, will be blocked until there's a receiver to receive it

❌ Not works
```
package main

import "fmt"

func main() {
	ch := make(chan int, 1) // buffer cap - 1
	go func(ch chan int) {
	}(ch)

	ch <- 1 
	ch <- 1 // blocks
	fmt.Println(<-ch) 
}

```

Channel's buffer is at capacity, remains be blocked until there's a receiver to receive it

✅ Works
```
package main

import "fmt"

func main() {
	ch := make(chan int, 1)
	go func(ch chan int) {
	}(ch)

	ch <- 1
	fmt.Println(<-ch) 
}

```

This prints 1, as the main routine is there receive from the sub go routine