Some extra installation notes.

### Installing Emscripten on M1 Mac

As of April, 2021. The default way of installing binary Emscripten (`emsdk install latest`) does not
work on M1 Mac. However, the following procedure to build from source works for me,

```
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install emscripten-main-64bit
./emsdk install llvm-git-main-64bit 
./emsdk install binaryen-main-64bit 
./emsdk activate emscripten-main-64bit
```

Append the following lines to .emscripten (or it complains about missing LLVM_ROOT),
```
LLVM_ROOT = emsdk_path + '/llvm/git/build_main_64/bin'
BINARYEN_ROOT = emsdk_path + '/binaryen/main_64bit_binaryen'
```

Then use emscripten as follows,
```
source emsdk_env.sh
em++
```

### Building raylib for emscripten

First clone raylib with `git clone https://github.com/raysan5/raylib.git`.

Checkout 3.5.0,
```
git checkout 3.5.0
```

Modify `src/Makefile` to fill in the paths:
```
    EMSDK_PATH         = Path to emsdk in last section
    EMSCRIPTEN_PATH    = $(EMSDK_PATH)/emscripten/main
    CLANG_PATH          = $(EMSDK_PATH)/llvm/git/build_main_64/bin
    PYTHON_PATH         = /opt/homebrew/bin
    NODE_PATH           = /opt/homebrew/bin
    export PATH         = $(EMSDK_PATH):$(EMSCRIPTEN_PATH):$(CLANG_PATH):$(NODE_PATH):$(PYTHON_PATH):$(shell printenv PATH)
```
Then `make PLATFORM=PLATFORM_WEB -B` will give you `libraylib.a` for WebAssembly.

See [Working for Web (HTML5)](https://github.com/raysan5/raylib/wiki/Working-for-Web-(HTML5)) for the official documentation on this.
