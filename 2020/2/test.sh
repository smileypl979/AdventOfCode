#!/bin/bash
# cd /home/student/aoc/01/input/
touch ./puzzle2.1
curl https://adventofcode.com/2020/day/2/input -O
sed 's/\r$//' ./input > out.txt
puzzle2=()
i=0
while read line; do puzzle2[$i]=$line && i=$((i+1)) ; done < out.txt
echo ${puzzle2[0]}