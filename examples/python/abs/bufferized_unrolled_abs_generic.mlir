"builtin.module"() ({
  "memref.global"() <{alignment = 64 : i64, constant, initial_value = dense<0> : tensor<3x4xi64>, sym_name = "__constant_3x4xi64", sym_visibility = "private", type = memref<3x4xi64>}> : () -> ()
  "func.func"() <{function_type = () -> tensor<3x4xi64>, sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %5 = "memref.get_global"() <{name = @__constant_3x4xi64}> : () -> memref<3x4xi64>
    %6 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4xi64>
    "scf.parallel"(%3, %3, %2, %0, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      %8 = "memref.load"(%5, %arg0, %arg1) : (memref<3x4xi64>, index, index) -> i64
      %9 = "arith.cmpi"(%8, %4) <{predicate = 5 : i64}> : (i64, i64) -> i1
      %10 = "arith.subi"(%4, %8) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %11 = "arith.select"(%9, %8, %10) : (i1, i64, i64) -> i64
      "memref.store"(%11, %6, %arg0, %arg1) : (i64, memref<3x4xi64>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    %7 = "bufferization.to_tensor"(%6) : (memref<3x4xi64>) -> tensor<3x4xi64>
    "func.return"(%7) : (tensor<3x4xi64>) -> ()
  }) : () -> ()
}) : () -> ()

