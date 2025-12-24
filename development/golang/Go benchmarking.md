---
tags:
type:
date: 2025-12-24
done: false
---
Go provides benchmarking feature, along with *fuzzy tests* on the testing package. 

```go
BenchX(b *testing.B) {
	for B.L {
		// do your thing
		fmt.Println("doing thing")
	}
}
```

The benchmark loops for some N times