#!/bin/bash

# Creating single binary distribution for elixir project

app=$1
target=/dev/shm/elixir-bintest/$app

mkdir -p $target
match=$(grep --text --line-number '^PAYLOAD:$' $0 | cut -d ':' -f 1)
payload_start=$((match + 1))

tail -n +$payload_start $0 | tar -C $target -zxf -

cd $target/rel/$app/bin
./$app "$@"

exit $?

