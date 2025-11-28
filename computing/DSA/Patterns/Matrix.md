---
tags:
type:
date: 2025-11-25
done: false
---
```go
func isValidSudoku(board [][]byte) bool {
	for _, row := range board {
		rowElements := make(map[byte]struct{})
		for _, ele := range row {
			_, ok := rowElements[ele]
			if ok && ele != '.' {
				return false
			}
			rowElements[ele] = struct{}{}
		}
	}

    for rowPtr := 0; rowPtr < 9; rowPtr++ {
		colElements := make(map[byte]struct{})
        for _, row := range board {
            ele := row[rowPtr]
            _, ok := colElements[ele]

            if ok && ele != '.' {
                return false
            }

            colElements[row[rowPtr]] = struct{}{}
        } 
    }

for br := 0; br < 3; br++ {          // box row
	for bc := 0; bc < 3; bc++ {      // box col
		seen := make(map[byte]struct{})

		for r := 0; r < 3; r++ {      // inside box rows
			for c := 0; c < 3; c++ {  // inside box cols
				ele := board[br*3+r][bc*3+c]
				if ele == '.' {
					continue
				}
				if _, ok := seen[ele]; ok {
					return false
				}
				seen[ele] = struct{}{}
			}
		}
	}
}

    
    
	return true
}
```