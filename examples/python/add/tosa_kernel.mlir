module {
  func.func @main() -> tensor<3x4xi64> {
    %0 = "tosa.const"() <{value = dense<0> : tensor<3x4xi64>}> : () -> tensor<3x4xi64>
    return %0 : tensor<3x4xi64>
  }
}

