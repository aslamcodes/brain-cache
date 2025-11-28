---
tags:
type:
date: 2025-11-02
done: false
---
If you have a function that should be executed no matter what operation you would like to do, such as connecting database, setting up your envs, working with global objects, you can leverage sync.Once.Do()

Here's a simplified code of what Do() does

```go
type Once struct {
	done bool
}

func (o *Once) Do(f) {
	if !o.done {
		f()
		o.done = true
	}
}
```