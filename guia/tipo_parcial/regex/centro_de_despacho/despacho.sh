#!/bin/bash

readonly id="$1"

sed -n "s|^[^;]*;\([^;]*\);[^;]*;[^;]*;[^;]*;${id};.*/.*/.\{4\} \(.*\);.*$|orden \1 para las \2 horas "