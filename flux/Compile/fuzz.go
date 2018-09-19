package Compile

import (
	"context"
	"time"

	"github.com/influxdata/flux"
)

var ctx = context.Background()
var now = time.Now()

func Fuzz(data []byte) int {
	spec, err := flux.Compile(ctx, string(data), now)
	if err != nil {
		// Not interesting.
		return -1
	}

	if err := spec.Validate(); err != nil {
		// Maybe interesting, but probably not.
		return 0
	}

	// It was valid, so probably interesting.
	return 1
}
