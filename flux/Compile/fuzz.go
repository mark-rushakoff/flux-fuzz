package Compile

import (
	"context"
	"time"

	"github.com/influxdata/flux"
)

var ctx = context.Background()
var now = time.Now()

func Fuzz(data []byte) (n int) {
	defer func() {
		// Workaround for https://github.com/influxdata/flux/issues/43
		if r := recover(); r != nil {
			e, _ok := r.(error)
			if _ok && e.Error() == "cannot get return type from kind invalid" {
				n = -1
			}
		}
	}()

	_, err := flux.Compile(ctx, script, now)
	return err == nil
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
