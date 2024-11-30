python3 stablehlo_*.py
~/CS521/stablehlo/build/bin/stablehlo-opt -stablehlo-legalize-to-linalg=enable-primitive-ops stablehlo_abs.mlir > linalg_abs.mlir
~/CS521/stablehlo/build/bin/stablehlo-opt -one-shot-bufferize -convert-linalg-to-parallel-loops -mlir-print-op-generic linalg_abs.mlir > bufferized_unrolled_abs.mlir
