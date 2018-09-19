#!/bin/bash

export GOBIN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && cd ../bin && pwd )"
go install ./vendor/github.com/dvyukov/go-fuzz/...
