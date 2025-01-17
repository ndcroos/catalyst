// Copyright 2023 Xanadu Quantum Technologies Inc.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef CATALYST_PASSES
#define CATALYST_PASSES

include "mlir/Pass/PassBase.td"

def ArrayListToMemRefPass : Pass<"convert-arraylist-to-memref"> {
    let summary = "Lower array list operations to memref operations.";
    let description = [{
        This pass implements dynamically resizable array lists via lowering
        them to mutable memrefs.
    }];

    let dependentDialects = [
        "mlir::arith::ArithDialect",
        "mlir::func::FuncDialect",
        "mlir::memref::MemRefDialect",
        "mlir::scf::SCFDialect"
    ];

    let constructor = "catalyst::createArrayListToMemRefPass()";
}

#endif // CATALYST_PASSES
