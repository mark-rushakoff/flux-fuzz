# flux-fuzz

Repository to aid in running [go-fuzz](https://github.com/dvyukov/go-fuzz) against [flux](https://github.com/influxdata/flux).

## Layout

The project is laid out in packages that map to flux package layout and method under test.
For example, `flux/parser_NewAST` contains code to fuzz the `github.com/influxdata/flux/parser.NewAST` function.

The `scripts` directory contains helper scripts so you don't have to think about what go-fuzz commands to run.

## Setup

This repository uses dep.
I attempted to use go modules, but I was finding that go-fuzz wouldn't cooperate; it seemed related to the fact that go-fuzz calls go-build under the hood.

Run `./scripts/setup.sh` to install the go-fuzz binaries to the bin directory.

Then run `./scripts/build.sh` with the full import path to one of the packages declaring a fuzz function, e.g. `./scripts/build.sh github.com/mark-rushakoff/flux-fuzz/flux/parser_NewAST`.

Finally, run `./scripts/run.sh` with the full import path you used in the previous step.
