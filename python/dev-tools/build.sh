#!/bin/bash

##  Get the directory that this script is in and move there
cd "$( dirname "$0" )"

exec docker build -t kariusdx/py-dev .
