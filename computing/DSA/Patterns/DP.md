---
tags:
type:
date: 2025-12-02
done: false
---
# Maximum SubArray Problem
```go
func maxSubArray(nums []int) int {
    maxSum := math.MinInt64
    currSum := 0

    for _, val := range nums {
       currSum += val
       if currSum > maxSum {
        maxSum = currSum
       } 
       if currSum < 0 {
        currSum = 0
       }
    }

    return maxSum
}
```
# Best time to sell stocks
**What's the core idea of the solution?**
The idea stems from solving the maximum subarray problem. The pattern felt similar, except we calculate the difference.

The Aha moment is when asking the question, what's the minimum size I see so far?  and what are the maximum profit we had so far. If we don't see any profit, we leave it

**How this solution accounts for the future nature of the question, you can't buy today and sell yesterday?**
The `minElement` is calculated after calculating the `currProfit`, which means I'm always calculating profit with the previous `minElement` I have seen so far, which ensures the **future** nature of the solution

```go
func maxProfit(prices []int) int {
	minElement := math.MaxInt64
    maxProfit := math.MinInt64

    for _, price := range prices {
        currProfit := price - minElement
        if currProfit < 0 {
            currProfit = 0
        }
        if maxProfit < currProfit {
            maxProfit = currProfit
        }
        if minElement > price {
            minElement = price
        }
    }

	return maxProfit 
}
```