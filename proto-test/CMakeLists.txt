cmake_minimum_required(VERSION 3.4.3)
project(proto-test)



set(Protobuf_INSTALL_PATH "/usr/local/protobuf/")
# set(Protobuf_INSTALL_PATH "/home/jerry/protobuf-3.14.0/cmake/release")
# set(Protobuf_INSTALL_PATH "/home/jerry/S32V/S32_x86/Install/Host")

set(Protobuf_PREFIX_PATH
"${Protobuf_INSTALL_PATH}/include"
"${Protobuf_INSTALL_PATH}/lib"
"${Protobuf_INSTALL_PATH}/bin"
)
list(APPEND CMAKE_PREFIX_PATH "${Protobuf_PREFIX_PATH}")

find_package(Protobuf REQUIRED)
include_directories(${Protobuf_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_BINARY_DIR})

message(STATUS "=================== CMAKE_PREFIX_PATH is: ${CMAKE_PREFIX_PATH}")
message(STATUS "================== LIB_PATH is: ${Protobuf_LIBRARIES}")
message(STATUS "================== INC_PATH is: ${Protobuf_INCLUDE_DIRS}")
message(STATUS "================== EXE_PATH is: ${Protobuf_PROTOC_EXECUTABLE}")
message(STATUS "================== CMAKE_CURRENT_SOURCE_DIR is: ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "================== HEAD_DIR is: ${HDRS}")

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

# add_proto_files(
#   DIRECTORY proto
#   FILES
#   chatter.proto
# )


list(APPEND PROTO_MSGS "${CMAKE_CURRENT_SOURCE_DIR}/proto/chatter.proto")
# list(APPEND PROTO_MSGS "${CMAKE_CURRENT_SOURCE_DIR}/proto/BarPlus.proto")
protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS ${PROTO_MSGS})
# list(APPEND ${HDRS} ${PROTO_HDRS})
# list(APPEND ${SRCS} ${PROTO_SRCS})

protobuf_generate_python(PROTO_PY ${PROTO_MSGS})
add_custom_target(myTarget ALL 
                  DEPENDS ${PROTO_PY})

message(STATUS "================== PROTO_PY is: ${PROTO_PY}")

add_executable(hello src/main.cpp ${PROTO_SRCS} ${PROTO_HDRS})
# add_executable(hello src/main.cpp)
target_link_libraries(hello ${PROTOBUF_LIBRARIES})
