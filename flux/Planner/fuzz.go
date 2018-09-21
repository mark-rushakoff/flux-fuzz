package Planner

import (
	"context"
	"time"

	"github.com/influxdata/flux"
	"github.com/influxdata/flux/plan"
)

var (
	ctx            = context.Background()
	now            = time.Now()
	logicalPlanner = plan.NewLogicalPlanner()
	planner        = plan.NewPlanner()
)

type emptyStorage struct{}

var emptyShardMap = make(plan.ShardMap)

func (es emptyStorage) ShardMapping() plan.ShardMap {
	return emptyShardMap
}

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

	spec, err := flux.Compile(ctx, string(data), now)
	if err != nil {
		// Not interesting.
		return -1
	}

	lps, err := logicalPlanner.Plan(spec)
	if err != nil {
		// Not interesting.
		return -1
	}

	_, err = planner.Plan(lps, emptyStorage{})
	if err != nil {
		// Not interesting.
		return -1
	}

	// Was able to plan successfully. Interesting if it increases coverage.
	return 0
}
