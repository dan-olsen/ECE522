
set(COMMON_CXX_FLAGS "-std=c++11 -Wall -fPIC")
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COMMON_CXX_FLAGS} -O3")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} ${COMMON_CXX_FLAGS} -g")

add_library(podem STATIC ${PODEM_SOURCES})

target_link_libraries(podem circuit)