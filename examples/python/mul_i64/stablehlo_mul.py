# Copyright 2024 The StableHLO Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from mlir import ir
import mlir.dialects.stablehlo as stablehlo
import mlir.dialects.func as func
from mlir.ir import Context, Location, InsertionPoint, Module
import numpy as np

with Context() as ctx, Location.unknown():
  stablehlo.register_dialect(ctx)
  module = Module.create()

  with InsertionPoint(module.body):

    @func.func()
    def main():
      a_value = ir.DenseElementsAttr.get(np.random.randint(50, size=1))
      a = stablehlo.constant(a_value)
      b_value = ir.DenseElementsAttr.get(np.random.randint(50, size=1))
      b = stablehlo.constant(b_value)
      add = stablehlo.multiply(a, b)
      return add

assert main.func_op.verify()
print(str(module))
