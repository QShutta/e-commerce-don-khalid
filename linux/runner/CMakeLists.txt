# Minimal runner CMakeLists to satisfy top-level CMake
# This creates the executable target using the project-level BINARY_NAME
cmake_minimum_required(VERSION 3.10)

# Source files for the runner executable
set(RUNNER_SRC "${CMAKE_CURRENT_SOURCE_DIR}/main.cc")

add_executable(${BINARY_NAME} "${RUNNER_SRC}")

# Apply common compile settings from top-level CMake
if(COMMAND APPLY_STANDARD_SETTINGS)
  APPLY_STANDARD_SETTINGS(${BINARY_NAME})
endif()

# Link to the Flutter library built by the flutter managed CMake code
# The flutter tool usually defines a imported target named "flutter".
# If it's not present, linking will be resolved later during the build.
if(TARGET flutter)
  target_link_libraries(${BINARY_NAME} PRIVATE flutter)
endif()
