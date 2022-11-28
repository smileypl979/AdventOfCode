#!/bin/bash
declare -a reading
read -p "Which input file for use? [test-input.txt]" inputfile
while read line; do reading+=("$line") ; done < $inputfile
echo ${reading[@]} 


