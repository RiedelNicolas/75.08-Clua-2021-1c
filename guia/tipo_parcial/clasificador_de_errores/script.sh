#!/bin/bash
errorcode=$1

grep    "^[^:]*:${errorcode}:.*$" | sed -n "s|^[^:]*:[^:]*:[^:]*:\([^:]*\):.* | la descrip es :\1 |p"
grep -v "^[^:]*:${errorcode}:.*$" | sed -n "s|.*|<${errorcode}> no clasificado |p"