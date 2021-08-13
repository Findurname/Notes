#!/usr/bin/env bash



function build_py_proto() {
  if [ -d "./py_proto" ];then
    rm -rf py_proto
  fi
  mkdir py_proto
  PROTOC='/usr/bin/protoc'
  find modules/ -name "*.proto" \
      | grep -v node_modules \
      | xargs ${PROTOC} --python_out=py_proto
  find py_proto/* -type d -exec touch "{}/__init__.py" \;
}
 
build_py_proto
