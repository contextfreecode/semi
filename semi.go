package main

import (
	"fmt"
	"math"
)

type Vector = []float64
type Matrix = []Vector

type Sprite = struct {
	Kind string
	Pos  Vector
}

func MatVecMul(mat Matrix, vec Vector) Vector {
	result := make(Vector, len(mat))
	for i, row := range mat {
		for j, val := range row {
			result[i] += val * vec[j]
		}
	}
	return result
}

func Rot(turns float64) Matrix {
	rad := 2 * math.Pi * turns
	// + 1
	return Matrix{
		Vector{math.Cos(rad), -math.Sin(rad)},
		Vector{math.Sin(rad), math.Cos(rad)},
	}
}

func main() {
	sprite := Sprite{Kind: "robot", Pos: Vector{1, 1}}
	viewPos := MatVecMul(Rot(1/4.0), sprite.Pos)
	fmt.Println(sprite.Kind, "rotated to", viewPos)
}
