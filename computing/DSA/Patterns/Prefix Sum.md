---
tags:
type:
date: 2025-11-24
done: false
---
# Idea

# Problems
## RunningSum
- This is problem is straight out prefix sum implementation.

```go
func runningSum(nums []int) []int {
   currSum := 0 
   prefixSum := []int{}

   for _, num := range nums {
    currSum += num
    prefixSum = append(prefixSum, currSum)
   }

   return prefixSum

```

## Product of array except self
- To calculate the product of array except current element for each index, we calculated the prefix product before and  suffix product after the current element.

```go
func productExceptSelf(nums []int) []int {
   prefix := 1
   suffix := 1
   result := make([]int, len(nums))

   for i, num := range nums {
        result[i] = prefix
        prefix *= num
   }
   
    for i := len(nums)-1; i >= 0; i-- {
        result[i] *= suffix
        suffix *= nums[i]
    }
   
   return result
}

```

# minStartValue

Calculate the minimum sum in the running sum. Once you find the lowest point that your running sum can ever be, you'd need to negate it with a counterpart, if you're lowest point is about -4, the you'd need start at 4 + 1 to keep the running sum above 1

```go
func minStartValue(nums []int) int {
    var sum, min int

    for _, n := range nums {
        sum += n
        if min > sum {
            min = sum
        }
    }

    return 1 - min
}
```

# car pooling
Perhaps the most interesting sum i ever solved by myself

```go
func carPooling(trips [][]int, capacity int) bool {
    maxPos := 0
	for _, t := range trips {
		if t[2] > maxPos {
			maxPos = t[2]
		}
	}

	boardingPlan := make([]int,     maxPos + 2)

	// trips -> flatmap of capacity changes
	// for [[2,1,5], [3,3,7]]
	// 0 -> none, 1 -> none, 2 -> +2, 3 -> +3, 4 -> none, 5 -> -2, 6-> none, 7 -> -3

	for _, trip := range trips {
		passengers := trip[0]
		from := trip[1]
		to := trip[2]

		// if len(boardingPlan) < to {
		// 	diff := to - len(boardingPlan)
		// 	boardingPlan = append(boardingPlan, make([]int, diff)...)
		// }

		boardingPlan[from] += passengers
		boardingPlan[to] -= passengers
	}

	// calculate that if ever the total capacity exceeds the car's capacity
	totalCapacity := 0

	for _, passengers := range boardingPlan {
		totalCapacity += passengers

		if totalCapacity > capacity {
			return false
		}
	}

	return true
}
```