#!/bin/bash
set -eu

for f in $(find . -name Dockerfile | xargs dirname); do
  $f/build.sh
done
