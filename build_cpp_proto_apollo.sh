#!/usr/bin/env bash





function build_cpp_proto() {
  if [ -d "./cpp_proto" ];then
    rm -rf cpp_proto
  fi
  mkdir cpp_proto
  PROTOC='/usr/bin/protoc'
  find modules/ -name "*.proto" \
      | grep -v node_modules \
      | xargs ${PROTOC} --cpp_out=cpp_proto;
#   find cpp_proto/* -type d -exec touch "{}/__init__.py" \;
}
 
build_cpp_proto

