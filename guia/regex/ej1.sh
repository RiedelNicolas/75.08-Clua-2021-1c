#!/bin/bash
sed 's-\([0-9]\)\([0-9]\)\([0-9]\)-\1\2\3\2\1-g' prueba.txt > out.txt 