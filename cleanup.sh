#!/bin/bash

find solutions/part*/ -type f -regex '.*\.\(log\|aux\|out\|fls\|fdb_latexmk\)' -exec rm -f {} \;
find template/ -type f -regex '.*\.\(log\|aux\|out\|fls\|fdb_latexmk\)' -exec rm -f {} \;