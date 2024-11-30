module {
  func.func @main() -> tensor<3x4xi64> {
    %c = stablehlo.constant dense<0> : tensor<3x4xi64>
    %0 = stablehlo.abs %c : tensor<3x4xi64>
    return %0 : tensor<3x4xi64>
  }
}

