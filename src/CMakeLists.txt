cmake_minimum_required(VERSION 3.12)

project(raylib-games-wasm)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
add_definitions(-DPLATFORM_WEB)

if (EMSCRIPTEN)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s USE_GLFW=3 -s ASSERTIONS=1 -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s ASYNCIFY")
    set(CMAKE_EXECUTABLE_SUFFIX ".html") # This line is used to set your executable to build with the emscripten html template so taht you can directly open it.
endif ()

# raylib.h for 3.5.0 is already in include/
# include_directories(/opt/homebrew/include)
include_directories(../include)
link_directories(../lib)

add_executable(arkanoid arkanoid.cpp)
target_link_libraries(arkanoid raylib)
target_link_options(arkanoid PRIVATE "SHELL: --preload-file assets/bricks.png --preload-file assets/hexagon_pattern.png --preload-file assets/player_bar.png")

add_executable(fps fps.cpp)
target_link_libraries(fps raylib)

add_executable(flappy_bird flappy_bird.cpp)
target_link_libraries(flappy_bird raylib)
target_link_options(flappy_bird PRIVATE "SHELL: --preload-file assets/flappy_bg.png --preload-file assets/flappy_bird.png --preload-file assets/flappy_tube.png")

add_executable(shapes shapes.cpp)
target_link_libraries(shapes raylib)

add_executable(snake snake.cpp)
target_link_libraries(snake raylib)

add_executable(space_invaders space_invaders.cpp)
target_link_libraries(space_invaders raylib)
target_link_options(space_invaders PRIVATE "SHELL: --preload-file assets/space_bg.png --preload-file assets/space_player.png --preload-file assets/space_enemy.png --preload-file assets/space_enemy2.png")

add_executable(zombie_animate zombie_animate.cpp)
target_link_libraries(zombie_animate raylib)
target_link_options(zombie_animate PRIVATE "SHELL: --preload-file assets/zombie.png")
