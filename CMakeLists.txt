cmake_minimum_required(VERSION 3.20)
project(gbemulator)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SRC_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(INCLUDE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/include)

add_executable(${PROJECT_NAME}
    ${SRC_ROOT}/main.cpp
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${INCLUDE_ROOT}
)

if(WIN32)
    target_compile_definitions(${PROJECT_NAME}
        PRIVATE
            OS_WINDOWS
    )
elseif(UNIX)
    target_compile_definitions(${PROJECT_NAME}
        PRIVATE
            OS_LINUX
    )
endif()

add_subdirectory(libs)

target_link_libraries(${PROJECT_NAME}
    PRIVATE

)