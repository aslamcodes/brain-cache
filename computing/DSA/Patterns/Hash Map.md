---
tags:
type:
date: 2025-11-11
done: false
---
I know that this is a hashmap problem. I initially constructed a hashmap with the array. And then I traversed the whole array again to check for complements of elements. This came with a caveat, if the current element is `3` and the target is `6` it would give you the same index, which is not allowed, hence I added a check `curr != pos`, that way same index issue is averted.

```go
func twoSum(nums []int, target int) []int {
    keys := make(map[int]int)

    for idx, ele := range nums {
        keys[ele] = idx
    }
    
    answer := make([]int, 2, 2)

    for curr, ele := range nums {
        complement := target - ele

        pos, exists := keys[complement]

        if exists && curr != pos {
            answer[0] = pos
            answer[1] = curr
            return answer
        }
    }

    return answer
}
```


**Input:** nums = [2,7,11,15], target = 9
**Output:** [0,1]
**Explanation:** Because nums[0] + nums[1] == 9, we return [0, 1].

This is complex and long. I wanted to reduce it to single for loop. 
- The first thought that came to my mind is the fact that for target of 9, if you're at 2, it might not find 7, as we have not yet added into the map ❓
	- I realized that you would eventually land at the last place of the array, when you are at last place of the array, you hashmap is fully constructed. ✅
- What about the same index problem ❓
	- This caused me a failure in test case
	- The idea is move the `key[ele]=idx` to the last place
	- If not, you would get `[0,0]`  target=6, [3,2,4]
	- Fact is you would not have your the last element added to the map. But when you are at the last element, you are searching for its complement which is available for you in the map.
 
 ```go
func twoSum(nums []int, target int) []int {
	keys := make(map[int]int)

	answer := make([]int, 2, 2)

	for idx, ele := range nums {
		complement := target - ele

		pos, exists := keys[complement]

		if exists {
			answer[0] = pos
			answer[1] = idx
			return answer
		}

		keys[ele] = idx
	}

	return answer
}

```