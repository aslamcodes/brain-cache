---
tags:
type:
date: 2025-09-07
done: false
---
```go
func main() {
	s := make([]int, 5) // len(a)=5

	for {
		printSlice(s)
		s = append(s, 1)
		time.Sleep(1 * time.Second)
	}

}

func printSlice(s []int) {
	fmt.Printf("len=%d cap=%d %v\n", len(s), cap(s), s)
}
```

Observation
```
len=5 cap=5 [0 0 0 0 0]
len=6 cap=10 [0 0 0 0 0 1]
len=7 cap=10 [0 0 0 0 0 1 1]
len=8 cap=10 [0 0 0 0 0 1 1 1]
len=9 cap=10 [0 0 0 0 0 1 1 1 1]
len=10 cap=10 [0 0 0 0 0 1 1 1 1 1]
len=11 cap=20 [0 0 0 0 0 1 1 1 1 1 1]
len=12 cap=20 [0 0 0 0 0 1 1 1 1 1 1 1]
len=13 cap=20 [0 0 0 0 0 1 1 1 1 1 1 1 1]
len=14 cap=20 [0 0 0 0 0 1 1 1 1 1 1 1 1 1]
len=15 cap=20 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1]
len=16 cap=20 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1]
len=17 cap=20 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1]
len=18 cap=20 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1]
len=19 cap=20 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
len=20 cap=20 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
len=21 cap=40 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
len=22 cap=40 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
len=23 cap=40 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
len=24 cap=40 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
len=25 cap=40 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
len=26 cap=40 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
len=27 cap=40 [0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
```

The capacity doubles after it exhausted. The reason could be due to the fact how go handles behind the scenes array of a slice.

