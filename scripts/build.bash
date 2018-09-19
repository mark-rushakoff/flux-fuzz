#!/bin/bash

if [ "$#" -ne 1 ]; then
  >&2 echo "Usage: $0 package_path

Example: $0 github.com/mark-rushakoff/flux-fuzz/flux/parser_NewAST
"
  exit 1
fi

export GOBIN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && cd ../bin && pwd )"

"$GOBIN/go-fuzz-build" -o "$GOBIN/../zip/$(basename "$1")-fuzz.zip" "$1"
