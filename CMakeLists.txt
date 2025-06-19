cmake_minimum_required(VERSION 3.10)
project(ShellReadline)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Regular build target (if used outside Docker)
add_executable(shell main.cpp)

find_library(READLINE_LIB readline)
find_library(HISTORY_LIB history)

if (READLINE_LIB AND HISTORY_LIB)
    target_link_libraries(shell ${READLINE_LIB} ${HISTORY_LIB})
else()
    message(WARNING "readline/history not found. Use 'make docker' to build inside Docker.")
endif()

# Add custom Docker build and run
add_custom_target(docker
    COMMAND docker build -t identicon-shell .
    COMMAND docker run -it identicon-shell
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Building and running in Docker"
)

