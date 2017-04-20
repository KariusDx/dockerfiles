#!/bin/bash

##  Get the directory that this script is in and move there
cd "$( dirname "$0" )"

image=$(grep FROM Dockerfile | awk '{print $2}')
cp ../entrypoint/set-user.sh .
entrypoint=$(docker inspect  -f '{{if .Config.Entrypoint}}{{json .Config.Entrypoint}}{{else}}[]{{end}}' \
  "$image" | jq -c '["/set-user.sh", .[]]')
cmd=$(docker inspect -f '{{json .Config.Cmd}}' "$image")

existing_entrypoint=$(grep ENTRYPOINT Dockerfile | awk '{$1=""; print $0}' | sed 's/^ //')
if [[ -z "$existing_entrypoint" ]]; then
  echo "ENTRYPOINT $entrypoint" >> Dockerfile
else
    if [[ "$existing_entrypoint" != "$entrypoint" ]]; then
        echo "found existing entrypoint:"
        echo "$existing_entrypoint"
        echo ""
        echo "update entrypoint to:"
        echo "$entrypoint"
        exit 1
    fi
fi

existing_cmd=$(grep CMD Dockerfile | awk '{$1=""; print $0}' | sed 's/^ //')
if [[ -z "$existing_cmd" ]]; then
  echo "CMD $cmd" >> Dockerfile
else
    if [[ "$existing_cmd" != "$cmd" ]]; then
        echo "found existing cmd:"
        echo "$existing_entrypoint"
        echo ""
        echo "update cmd to:"
        echo "$cmd"
        exit 1
    fi
fi

exec docker build -t kariusdx/jupyter-notebook .
