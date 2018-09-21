package parser_NewAST

import (
	"reflect"

	"github.com/influxdata/flux/parser"
)

func Fuzz(data []byte) int {
	ast, err := parser.NewAST(string(data))
	if err != nil {
		// Not interesting.
		return -1
	}

	c1 := ast.Copy()
	c2 := c1.Copy()
	if !reflect.DeepEqual(c1, c2) {
		panic("copy of copy changed")
	}
	return 0
}
