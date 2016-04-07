include_directories("${CMAKE_SOURCE_DIR}/modules/circuit/include")
include_directories(include)

file(GLOB_RECURSE PODEM_SOURCES "src/*.cpp")

file(GLOB_RECURSE PODEM_HEADERS "include/*.hpp")
add_custom_target(podem_headers SOURCES ${PODEM_HEADERS})

add_subdirectory(src)
#add_subdirectory(test)