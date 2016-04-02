include_directories(include)

file(GLOB_RECURSE CIRCUIT_SOURCES "src/*.cpp")

file(GLOB_RECURSE CIRCUIT_HEADERS "include/*.hpp")
add_custom_target(circuit_headers SOURCES ${CIRCUIT_HEADERS})

add_subdirectory(src)
#add_subdirectory(test)