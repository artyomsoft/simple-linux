#! /bin/bash
set -e
for script in $(ls ./build-steps/*); do
  pushd .
  . $script
  popd
done

. ./start-linux.sh


