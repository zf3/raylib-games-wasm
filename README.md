## Web Games using raylib - Sample Code

Sample code that shows how games developed with the [raylib](https://www.raylib.com/) engine can be compiled to WebAssembly and deployed on the Web, using Emscripten. 

This is based on [Ian's Raylib Practices](https://github.com/ianpan870102/raylib-practices). The games are written in C++ and very simple (are 100-400 lines of code each).

### Instructions

Assuming you have Python 3, [Emscripten](https://emscripten.org/) and Cmake installed on MacOS or Linux. You can build everything simply with,
```
./build.sh
```

Then you can serve the games with,
```
cd build/web
python3 -m http.server
```

Direct your browser to http://localhost:8000 to view the games. 

*arkanoid*:

<img src="screenshots/arkanoid_gameplay.png" width=400>

For instructions to install Emscripten on M1 Mac and build raylib for WebAssembly, see [INSTALL.md](INSTALL.md)