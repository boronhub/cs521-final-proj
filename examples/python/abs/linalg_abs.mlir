//  ~/CS521/stablehlo/build/bin/stablehlo-opt -stablehlo-legalize-to-linalg=enable-primitive-ops stablehlo_abs.mlir > linalg_abs.mlir
module {
  func.func @main() -> tensor<3x4xi64> {
    %cst = arith.constant dense<0> : tensor<3x4xi64>
    %0 = tensor.empty() : tensor<3x4xi64>
    %mapped = linalg.map ins(%cst : tensor<3x4xi64>) outs(%0 : tensor<3x4xi64>)
      (%in: i64) {
        %c0_i64 = arith.constant 0 : i64
        %1 = arith.cmpi sge, %in, %c0_i64 : i64
        %2 = arith.subi %c0_i64, %in : i64
        %3 = arith.select %1, %in, %2 : i64
        linalg.yield %3 : i64
      }
    return %mapped : tensor<3x4xi64>
  }
}

