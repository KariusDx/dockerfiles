#!/bin/bash

##  Get the directory that this script is in and move there
cd "$( dirname "$0" )"

exec docker build -f node6.Dockerfile -t kariusdx/node-frontend:6.9 .
