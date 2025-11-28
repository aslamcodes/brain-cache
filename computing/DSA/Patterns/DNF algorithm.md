---
tags:
type:
date: 2025-11-16
done: false
---
https://medium.com/@shazilkhannew/dutch-national-flag-algorithm-dnf-c1a41c57cdd9

The array is divided into three parts

0 to lo - 1 > all zeros
lo to mid - 1 > all ones
mid to hi > all twos

when mid is 0 we swap it with low and increase the mid and low by one
when mid is 1 we just move mid
when mid is 2 we swap it with value *from* hi and don't increase the mid, as the value from hi might not be evaluated

```go

```

Alternatively this can be solved with a two pass algorithm like counting all zeros, ones and twos and filling the array in the order

```go
func sortColors(nums []int)  {
    c0 := 0
    c1 := 0
    c2 := 0

    for _, val := range nums {
        if val == 0 {
            c0++
        } else if val  == 1 {
            c1++
        } else {
            c2++
        }
    }

    var i = 0

    for c0 > 0 {
        nums[i] = 0
        i++
        c0--
    }

    for c1 > 0 {
        nums[i] = 1
        i++
        c1--
    }

    for c2 > 0 {
        nums[i] = 2
        i++
        c2--
    }
}
```