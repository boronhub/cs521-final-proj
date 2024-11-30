#map = affine_map<(d0) -> (d0)>
module {
  func.func @main() -> tensor<1xi64> {
    %cst = arith.constant dense<27> : tensor<1xi64>
    %cst_0 = arith.constant dense<12> : tensor<1xi64>
    %0 = tensor.empty() : tensor<1xi64>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%cst, %cst_0 : tensor<1xi64>, tensor<1xi64>) outs(%0 : tensor<1xi64>) {
    ^bb0(%in: i64, %in_1: i64, %out: i64):
      %2 = arith.muli %in, %in_1 : i64
      linalg.yield %2 : i64
    } -> tensor<1xi64>
    return %1 : tensor<1xi64>
  }
}

