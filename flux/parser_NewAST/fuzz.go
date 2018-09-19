package parser_NewAST

import "github.com/influxdata/flux/parser"

func Fuzz(data []byte) int {
	if _, err := parser.NewAST(string(data)); err != nil {
		// Not interesting.
		return 0
	}

	// Parsed successfully. That's interesting.
	return 1
}
