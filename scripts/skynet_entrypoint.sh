#! /bin/bash

if [[ ! -d "./llama.cpp" ]]; then
    echo "Cloning llama.cpp ..."
    git clone https://github.com/ggerganov/llama.cpp
fi

ROOT_DIR="$(pwd)"

DEB_PACKAGE_TREE='llama-t1985'

LLAMA_ROOT=${ROOT_DIR}/llama.cpp
DEB_PACKAGE_ROOT=${ROOT_DIR}/${DEB_PACKAGE_TREE}

export DEB_PACKAGE_ROOT
export LLAMA_ROOT
export ROOT_DIR
export DEB_PACKAGE_TREE

cd "${LLAMA_ROOT}" || exit 1

echo "Building llama.cpp ..."

cmake -B build \
    -DGGML_CUDA=ON \
    -DCMAKE_CUDA_ARCHITECTURES="120" \
    -DCMAKE_CUDA_FLAGS="-Wno-deprecated-gpu-targets -O3" \
    -DCMAKE_BUILD_TYPE=Release \
    -DGGML_BLAS=ON  && \
cmake --build build --config Release --parallel=6  && \
echo "llama.cpp built successfully" || echo "Llama.cpp building failed"

generate_deb_package.sh