---
tags:
type:
date: 2025-11-20
done: false
---
# Idea
### Why Mono Decreasing stack gives you next greater element
- As you scan the array, you keep the stack *decreasing*. ie the Top is **lesser** than item below it
- When a new number is larger than the top, the top gets popped. 
- That pop event tells you:  **this new number is the next greater element for the popped one** because *nothing between them was greater.*
### Why Mono Increasing stack gives you next smaller element
- As you scan the array, you keep the stack *increasing*. ie the Top is **greater** than item below it
- When a new number is *smaller* than the top, the top gets popped. 
- That pop event tells you:  **this new number is the next smaller element for the popped one** because *nothing between them was smaller*.

# Problems
## Final Prices
```go
type IndexValue struct {
    Index int
    Value int
}

func finalPrices(prices []int) []int {
    mi := []IndexValue{}

    for idx, price := range prices {
        for len(mi) > 0 && mi[len(mi) - 1].Value >= price {
            top := mi[len(mi) - 1]
            prices[top.Index] = top.Value - price // use the top
            mi = mi[:len(mi) - 1] // pop
        }
        mi = append(mi, IndexValue{
            Value: price,
            Index: idx,
        })
    }

	return prices
}
```


## Next Greater Element
```go
type MDStack struct {
    Index int
    Value int
}    

func nextGreaterElement(nums1 []int, nums2 []int) []int {
    Map := make(map[int]int)

    st := []MDStack{}

    for idx, val := range nums2 {
        for len(st) > 0 && st[len(st) - 1].Value < val {
            top := st[len(st) - 1]
            st = st[:len(st) - 1]
            Map[top.Value] = val
        }
        st = append(st, MDStack{
            Index: idx,
            Value: val,
        })
    }    

    ans := []int{}

    for _, num := range nums1 {
        v, ok := Map[num] 
        if !ok {
            ans = append(ans, -1)
        } else {
            ans = append(ans, v)
        }
    }

    return ans
}
```
## Next Greater Element 2
Its required to find the next greater element of a cyclic array. Simply running the mono decreasing strategy on the array does the trick

```go
type IndexValue struct {
	Index int
	Value int
}

func nextGreaterElements(nums []int) []int {
	ans := make([]int, len(nums))

	for i := range ans {
	    ans[i] = -1
	}

	st:=[]IndexValue{}
	
	for times := 0; times < 2; times++ {
		for i, val := range nums {
			for len(st) > 0 && st[len(st)-1].Value < val {
				top := st[len(st)-1]
				st = st[:len(st)-1]
                if top.Index != i {
                    ans[top.Index] = val
                }
			}
            st = append(st, IndexValue{
                Index: i,
                Value: val,
            })
		}
	}

	return ans

}
```

## Online Stock Span
 The intuition is you apply the monotonic increasing array scan on a array without popping elements off, so that every time next is being called it would get its span.
 The solution turned out to be a O(n^2), since we are potentially looking back the whole price history
```go
type StockSpanner struct {
    priceHistory []int
}


func Constructor() StockSpanner {
    return StockSpanner{
    }
}


func (this *StockSpanner) Next(price int) int {
    // As long as the current day disturbs the monotonic increasing property, we increase the count, and NOT pop the elements, so that next days calculation doesn't require to rebuild the stack

    days := len(this.priceHistory)
    span := 1

    for days > 0 && price >= this.priceHistory[days - 1] {
        span++
        days--
    }

    this.priceHistory = append(this.priceHistory, price)

    return span
}


/**
 * Your StockSpanner object will be instantiated and called as such:
 * obj := Constructor();
 * param_1 := obj.Next(price);
 */
```