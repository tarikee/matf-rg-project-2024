HOW TO SET UP AND RUN ON macOS (Apple Silicon)
===============================================

REQUIREMENTS:
- macOS 12 or later
- Homebrew (https://brew.sh)
- Xcode Command Line Tools: xcode-select --install

FIRST TIME SETUP:
-----------------

1. Clone the repo:
   git clone --recursive git@github.com:tarikee/matf-rg-project-2024.git
   cd matf-rg-project-2024

2. Run the macOS setup script:
   ./setup_macos.sh

3. Add the compiler to your shell (run once, then restart terminal):
   echo 'export CC=$(brew --prefix llvm)/bin/clang' >> ~/.zshrc
   echo 'export CXX=$(brew --prefix llvm)/bin/clang++' >> ~/.zshrc
   source ~/.zshrc

4. Configure the build:
   cmake -B build -DCMAKE_BUILD_TYPE=Debug

5. Build:
   cmake --build build

RUNNING:
--------

Test app (professor's example):
   cd engine/test/app
   ./test-app

Your app:
   cd app
   ./APP

IMPORTANT: Always run the app from its own directory (not from the repo root).

CONTROLS:
   F1   - toggle mouse capture for camera control (press this first!)
   F2   - toggle GUI
   WASD - move camera
   ESC  - quit

WHY THE EXTRA STEPS?
--------------------
The project requires C++23, which Apple's built-in clang does not support.
The setup script installs LLVM via Homebrew which has full C++23 support.
The macOS-specific changes in this repo (vs the professor's original):
  - setup_macos.sh
  - engine/CMakeLists.txt (Homebrew paths)
  - engine/libs/glad/include/KHR/khrplatform.h (missing on macOS)
  - engine/src/PlatformController.cpp (GLFW working directory fix)
