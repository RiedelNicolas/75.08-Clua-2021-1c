#!/bin/bash
### No se puede usar AWK.
#grep '.*:[7-9]\.\([6-9]|5[3-9][5-9]\)' "datos7.txt"
grep '.*:\([8-9]|\([7].[6-9]|[7][5][3-9]\)\)' "datos7.txt"