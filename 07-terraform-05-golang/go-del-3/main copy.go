package main

import (
	"fmt"
)

func main() {
	//x := []int{55, 3, 9, 12}
	a := makeRange(1, 100)

	for _, value := range a {
		res := value % 3
		if res < 1 {
			fmt.Println(value, "число делится на 3")
		}

	}
}

func makeRange(min, max int) []int {
	a := make([]int, max-min+1)
	for i := range a {
		a[i] = min + i
	}
	return a
}
