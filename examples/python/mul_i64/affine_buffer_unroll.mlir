#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (1)>
"builtin.module"() ({
  "memref.global"() <{alignment = 64 : i64, constant, initial_value = dense<12> : tensor<1xi64>, sym_name = "__constant_1xi64_0", sym_visibility = "private", type = memref<1xi64>}> : () -> ()
  "memref.global"() <{alignment = 64 : i64, constant, initial_value = dense<27> : tensor<1xi64>, sym_name = "__constant_1xi64", sym_visibility = "private", type = memref<1xi64>}> : () -> ()
  "func.func"() <{function_type = () -> tensor<1xi64>, sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 324 : i64}> : () -> i64
    %1 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi64>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.store"(%0, %1, %arg0) <{map = #map}> : (i64, memref<1xi64>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %2 = "bufferization.to_tensor"(%1) : (memref<1xi64>) -> tensor<1xi64>
    "func.return"(%2) : (tensor<1xi64>) -> ()
  }) : () -> ()
}) : () -> ()

