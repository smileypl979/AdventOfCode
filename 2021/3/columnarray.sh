#!/bin/bash
declare -a reading
read -p "Which input file for use? [test-input.txt]" inputfile
while read line; do reading+=("$line") ; done < $inputfile
echo ${reading[@]} 
#################
i=0
j=0
rows=${#reading[@]}
echo "Rows is $rows"
cols=$(echo -n "${reading[0]}" | wc -c)
echo "Columns is $cols"
declare -a grid
x=0;y=0;i=0
for ((x=0; x<rows; x++))
do
  for ((y=0; y<cols; y++))
  do
    grid[${x},${y}]=${reading[$x]:$y:1}
  done
done
x=0;y=0;i=0
for ((i=0; i<rows; i++))
do
  for ((y=0; y<cols; y++))
  do
    echo -ne "${grid[${x},${y}]}\t"
  done
  echo
done
