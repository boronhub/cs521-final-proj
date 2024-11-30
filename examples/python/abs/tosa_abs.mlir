module {
  func.func @main() -> tensor<3x4xi64> {
    %0 = "tosa.const"() <{value = dense<0> : tensor<3x4xi64>}> : () -> tensor<3x4xi64>
    %1 = tosa.abs %0 : (tensor<3x4xi64>) -> tensor<3x4xi64>
    return %1 : tensor<3x4xi64>
  }
}

