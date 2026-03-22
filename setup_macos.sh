#!/bin/bash
set -e

# Check for Homebrew
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Install it from https://brew.sh and re-run this script."
    exit 1
fi

echo "Installing dependencies..."
brew install cmake llvm clang-format assimp doxygen graphviz python3

echo ""
echo "Setting up Python virtual environment..."
python3 -m venv .venv
source ".venv/bin/activate" && pip3 install libclang

echo ""
echo "===================================================="
echo "Setup complete."
echo ""
echo "IMPORTANT: This project requires C++23. Apple's default clang"
echo "does not support it. You must use LLVM from Homebrew."
echo ""
echo "Before running CMake (every terminal session), run:"
echo ""
echo "  export CC=\$(brew --prefix llvm)/bin/clang"
echo "  export CXX=\$(brew --prefix llvm)/bin/clang++"
echo ""
echo "Then configure the project with:"
echo ""
echo "  cmake -B build -DCMAKE_BUILD_TYPE=Debug"
echo "  cmake --build build"
echo ""
echo "Or in CLion: Settings -> Build,Execution,Deployment -> Toolchains"
echo "  -> Add -> Custom -> set C compiler and C++ compiler to the paths above."
echo "===================================================="
