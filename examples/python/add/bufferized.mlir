#map = affine_map<(d0) -> (d0)>
module {
  memref.global "private" constant @__constant_1xi32_0 : memref<1xi32> = dense<4> {alignment = 64 : i64}
  memref.global "private" constant @__constant_1xi32 : memref<1xi32> = dense<0> {alignment = 64 : i64}
  func.func @main() -> tensor<1xi32> {
    %0 = memref.get_global @__constant_1xi32 : memref<1xi32>
    %1 = memref.get_global @__constant_1xi32_0 : memref<1xi32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1xi32>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%0, %1 : memref<1xi32>, memref<1xi32>) outs(%alloc : memref<1xi32>) {
    ^bb0(%in: i32, %in_1: i32, %out: i32):
      %3 = arith.addi %in, %in_1 : i32
      linalg.yield %3 : i32
    }
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1xi32>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%alloc, %1 : memref<1xi32>, memref<1xi32>) outs(%alloc_0 : memref<1xi32>) {
    ^bb0(%in: i32, %in_1: i32, %out: i32):
      %3 = arith.muli %in, %in_1 : i32
      linalg.yield %3 : i32
    }
    %2 = bufferization.to_tensor %alloc_0 : memref<1xi32>
    return %2 : tensor<1xi32>
  }
}

