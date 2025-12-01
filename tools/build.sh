#!/usr/bin/env bash

set -e  # exit on error

PROJECT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
BUILD_DIR="$PROJECT_ROOT/build"

# Remove old build directory if it exists
if [ -d "$BUILD_DIR" ]; then
    echo "Removing old build directory: $BUILD_DIR"
    rm -rf "$BUILD_DIR"
fi

# Recreate build directory
mkdir -p "$BUILD_DIR"

# Select toolchain on Windows (MSYS/Cygwin)
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    TOOLCHAIN="-DCMAKE_TOOLCHAIN_FILE=$PROJECT_ROOT/cmake/clang-mingw-toolchain.cmake"
else
    TOOLCHAIN=""
fi

cmake -S "$PROJECT_ROOT" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release $TOOLCHAIN
cmake --build "$BUILD_DIR" --config Release
