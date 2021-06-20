#!/bin/bash
readonly fecha=$(date '+%Y-%m-%d')
tar cvfz "${fecha}-${1}.tar.gz" "${1}/"