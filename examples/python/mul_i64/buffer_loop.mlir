"builtin.module"() ({
  "memref.global"() <{alignment = 64 : i64, constant, initial_value = dense<12> : tensor<1xi64>, sym_name = "__constant_1xi64_0", sym_visibility = "private", type = memref<1xi64>}> : () -> ()
  "memref.global"() <{alignment = 64 : i64, constant, initial_value = dense<27> : tensor<1xi64>, sym_name = "__constant_1xi64", sym_visibility = "private", type = memref<1xi64>}> : () -> ()
  "func.func"() <{function_type = () -> tensor<1xi64>, sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.get_global"() <{name = @__constant_1xi64}> : () -> memref<1xi64>
    %3 = "memref.get_global"() <{name = @__constant_1xi64_0}> : () -> memref<1xi64>
    %4 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi64>
    "scf.for"(%1, %0, %0) ({
    ^bb0(%arg0: index):
      %6 = "memref.load"(%2, %arg0) <{nontemporal = false}> : (memref<1xi64>, index) -> i64
      %7 = "memref.load"(%3, %arg0) <{nontemporal = false}> : (memref<1xi64>, index) -> i64
      %8 = "arith.muli"(%6, %7) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "memref.store"(%8, %4, %arg0) <{nontemporal = false}> : (i64, memref<1xi64>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %5 = "bufferization.to_tensor"(%4) : (memref<1xi64>) -> tensor<1xi64>
    "func.return"(%5) : (tensor<1xi64>) -> ()
  }) : () -> ()
}) : () -> ()

