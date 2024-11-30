module {
  func.func @main() -> tensor<1xi64> {
    %c = stablehlo.constant dense<27> : tensor<1xi64>
    %c_0 = stablehlo.constant dense<12> : tensor<1xi64>
    %0 = stablehlo.multiply %c, %c_0 : tensor<1xi64>
    return %0 : tensor<1xi64>
  }
}

