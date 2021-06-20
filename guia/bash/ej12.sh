#!/bin/bash

for file in "$(find . -type f -name "*.log")"; do
    if [ "$(wc -l "$file" | awk '{ print $1 }')" -gt 2000]; then
        head -1000 "$file" > "$file".rot
        sed "$file"
    fi
done

#sed para quedarme solo con unas lineas.