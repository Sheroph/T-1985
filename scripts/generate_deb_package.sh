#! /bin/bash

echo "Creating debian package ..."
cd "${ROOT_DIR}" || exit 1

mkdir -p "${DEB_PACKAGE_ROOT}/DEBIAN"

echo "Moving debian package metadata into build directory."
mv "${ROOT_DIR}/DEBIAN" "${DEB_PACKAGE_ROOT}/"

DEB_PACKAGE_LIB=${DEB_PACKAGE_ROOT}/usr/local/lib
DEB_PACKAGE_BIN=${DEB_PACKAGE_ROOT}/usr/local/bin

mkdir -p "${DEB_PACKAGE_LIB}"
mkdir -p "${DEB_PACKAGE_BIN}"

LLAMA_BUILD_DIR=${LLAMA_ROOT}/build

cd "${DEB_PACKAGE_ROOT}" || exit 1

echo "Copying binaries into package build directory."
# copy all binairies from llama.cpp to debian package
find "${LLAMA_BUILD_DIR}/bin" -iname '*.so' -exec cp {} "${DEB_PACKAGE_LIB}" \;
find "${LLAMA_BUILD_DIR}" -iname '*.a' -exec cp {} "${DEB_PACKAGE_LIB}" \;
find "${LLAMA_BUILD_DIR}/bin" -iname 'llama-*' -exec cp {} "${DEB_PACKAGE_BIN}" \;

cd "${ROOT_DIR}" || exit 1
echo "Generating debian package ..."
dpkg-deb --build "${DEB_PACKAGE_TREE}"

echo "Moving package into mounted host directory."

mv llama-t1985.deb /data/package

echo "Debian package created."
