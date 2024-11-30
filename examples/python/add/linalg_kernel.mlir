#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @main() -> tensor<3x4xi64> {
    %cst = arith.constant dense<0> : tensor<3x4xi64>
    %cst_0 = arith.constant dense<0> : tensor<3x4xi64>
    %0 = tensor.empty() : tensor<3x4xi64>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%cst, %cst_0 : tensor<3x4xi64>, tensor<3x4xi64>) outs(%0 : tensor<3x4xi64>) {
    ^bb0(%in: i64, %in_1: i64, %out: i64):
      %2 = arith.addi %in, %in_1 : i64
      linalg.yield %2 : i64
    } -> tensor<3x4xi64>
    return %1 : tensor<3x4xi64>
  }
}

