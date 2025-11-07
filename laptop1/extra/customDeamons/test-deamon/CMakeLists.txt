cmake_minimum_required(VERSION 3.5)

project(CENG C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

#file(GLOB_RECURSE SOURCES  
#               ${CMAKE_CURRENT_LIST_DIR}/src/*.cpp
#               ${CMAKE_CURRENT_LIST_DIR}/src/*.c
#               ${CMAKE_CURRENT_LIST_DIR}/src/*.h
#               ${CMAKE_CURRENT_LIST_DIR}/src/*.hpp
#               )
               
add_executable(CLIENT_EXEC ${CMAKE_CURRENT_LIST_DIR}/src/echo_client)
add_executable(SERVER_EXEC ${CMAKE_CURRENT_LIST_DIR}/src/echo_server)

target_compile_options(CLIENT_EXEC PUBLIC -std=c++17 -Wall -g)
target_compile_options(SERVER_EXEC PUBLIC -std=c++17 -Wall -g)

target_include_directories(CLIENT_EXEC PUBLIC ${CMAKE_CURRENT_LIST_DIR}/src)
target_include_directories(SERVER_EXEC PUBLIC ${CMAKE_CURRENT_LIST_DIR}/src)


