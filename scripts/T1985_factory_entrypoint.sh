#! /bin/bash

echo "Cloning llama.cpp ..."
# git clone https://github.com/ggerganov/llama.cpp

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
    -DCMAKE_CUDA_FLAGS="-Wno-deprecated-gpu-targets -O3" \
    -DGGML_CCACHE=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLAMA_CUDA_ARCHS=all && \
cmake --build build --config Release "-j$(nproc)" && \
echo "llama.cpp built successfully" || echo "Llama.cpp building failed"

generate_deb_package.sh
