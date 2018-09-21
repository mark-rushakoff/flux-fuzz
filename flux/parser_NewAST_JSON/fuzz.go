package parser_NewAST_JSON

import (
	"bytes"
	"os/exec"

	"github.com/influxdata/flux/ast"
	"github.com/influxdata/flux/parser"
)

func Fuzz(data []byte) int {
	parsedAST, err := parser.NewAST(string(data))
	if err != nil {
		// Not interesting.
		return -1
	}

	// Parsed successfully. Serialize to JSON.
	origJS, err := parsedAST.MarshalJSON()
	if err != nil {
		// Very interesting.
		println("Error marshaling original JSON:")
		panic(err)
	}

	var clonedAST ast.Program
	if err := clonedAST.UnmarshalJSON(origJS); err != nil {
		// Also very interesting.
		println("Error unmarshaling JSON:")
		panic(err)
	}

	cloneJS, err := clonedAST.MarshalJSON()
	if err != nil {
		println("Error marshaling cloned JSON:")
		panic(err)
	}

	normOrig := normalize(origJS)
	normClone := normalize(cloneJS)
	if normOrig != normClone {
		panic("Difference:\n" + normOrig + "\n" + normClone)
	}

	// Kind of interesting if we were able to go back and forth.
	return 1
}

// normalize shells out to jq, in hopes that we can avoid
// go-fuzz trying to instrument encoding/json.
func normalize(json []byte) string {
	jqCmd := exec.Command("jq", "-S", ".")
	jqCmd.Stdin = bytes.NewReader(json)

	out, err := jqCmd.Output()
	if err != nil {
		println("Error getting output:")
		panic(err)
	}
	return string(out)
}
