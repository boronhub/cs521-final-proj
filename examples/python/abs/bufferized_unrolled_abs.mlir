module {
  memref.global "private" constant @__constant_3x4xi64 : memref<3x4xi64> = dense<0> {alignment = 64 : i64}
  func.func @main() -> tensor<3x4xi64> {
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %c0_i64 = arith.constant 0 : i64
    %0 = memref.get_global @__constant_3x4xi64 : memref<3x4xi64>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x4xi64>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c3, %c4) step (%c1, %c1) {
      %2 = memref.load %0[%arg0, %arg1] : memref<3x4xi64>
      %3 = arith.cmpi sge, %2, %c0_i64 : i64
      %4 = arith.subi %c0_i64, %2 : i64
      %5 = arith.select %3, %2, %4 : i64
      memref.store %5, %alloc[%arg0, %arg1] : memref<3x4xi64>
      scf.reduce 
    }
    %1 = bufferization.to_tensor %alloc : memref<3x4xi64>
    return %1 : tensor<3x4xi64>
  }
}

