#!/bin/bash
if [ ! -d "$PWD/lib/gen" ]
then
  mkdir -p lib/gen
fi

rm -f lib/gen/*.pb*.dart

protoc --dart_out=grpc:lib/gen -I../proto ../proto/gamepad.proto
