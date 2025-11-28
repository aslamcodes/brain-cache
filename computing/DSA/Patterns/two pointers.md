---
tags:
type:
date: 2025-11-12
done: false
---
**Is Palindrome**
```go
func toLower(r byte) byte {
	if r >= 'A' && r <= 'Z' {
		return r + 32
	}
	return r
}

func isAlphaNum(r byte) bool {
	return (r >= 'a' && r <= 'z') || (r >= 'A' && r <= 'Z') || (r >= '0' && r <= '9')
}

func isPalindrome(s string) bool {
	i, j := 0, len(s)-1

	for i < j {
		for i < j && !isAlphaNum(s[i]) {
			i++
		}
		for i < j && !isAlphaNum(s[j]) {
			j--
		}

		if toLower(s[i]) != toLower(s[j]) {
			return false
		}
		i++
		j--
	}

	return true
}

```

# Two Sum - Sorted
```go
func twoSum(numbers []int, target int) []int {
    i := 0
    j := len(numbers) - 1

    for i < j {
        sum :=  numbers[i] + numbers[j]
        if sum == target {
            return []int{i+1, j+1}
        }

        if sum > target {
            j--
        } else {
            i++
        }
    }

    return []int{}
}
```