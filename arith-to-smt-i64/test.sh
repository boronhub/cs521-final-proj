#!/bin/bash

for file in *.mlir; do
  filename="${file%.*}"
  xdsl-smt "$filename.mlir" -p=lower-to-smt,lower-effects,canonicalize,dce,merge-func-results -t=smt > "$filename.smt"
done