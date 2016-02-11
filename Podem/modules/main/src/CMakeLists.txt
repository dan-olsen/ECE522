include_directories("${CMAKE_SOURCE_DIR}/modules/circuit/include")

#set(COMMON_CXX_FLAGS "-std=c++11 -Wall")
#set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COMMON_CXX_FLAGS} -O3")
#set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} ${COMMON_CXX_FLAGS} -g")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -g")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

add_executable(Podem ${MAIN_SOURCES})

target_link_libraries(Podem circuit)