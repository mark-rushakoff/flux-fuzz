#!/bin/bash

if [ "$#" -ne 1 ]; then
  >&2 echo "Usage: $0 package_path

Example: $0 github.com/mark-rushakoff/flux-fuzz/flux/parser_NewAST
"
  exit 1
fi

export GOBIN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && cd ../bin && pwd )"

# The examples-flux directory is kind of a catch-all corpus.
# We'll use it as the default, but there are some special cases
# when we explicitly don't want flux statements that don't compile.
WORKDIR="$PWD/examples-flux"

prefix="github.com/mark-rushakoff/flux-fuzz/flux"

case "$1" in
  "${prefix}/Compile")
    WORKDIR="$PWD/examples-flux-mustcompile"
    ;;
  "${prefix}/Planner")
    WORKDIR="$PWD/examples-flux-mustplan"
    ;;
esac

"$GOBIN/go-fuzz" -bin "$GOBIN/../zip/$(basename "$1")-fuzz.zip" -workdir="$WORKDIR"
