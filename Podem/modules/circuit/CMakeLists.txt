include_directories(include)

file(GLOB_RECURSE CIRCUIT_SOURCES "src/*.cpp")

add_subdirectory(src)
#add_subdirectory(test)