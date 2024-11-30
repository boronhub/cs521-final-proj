module {
  func.func @main() -> tensor<3x4xi64> {
    %c = stablehlo.constant dense<0> : tensor<3x4xi64>
    %c_0 = stablehlo.constant dense<0> : tensor<3x4xi64>
    %0 = stablehlo.add %c, %c_0 : tensor<3x4xi64>
    return %0 : tensor<3x4xi64>
  }
}

