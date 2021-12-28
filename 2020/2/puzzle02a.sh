#!/bin/bash
# cd /home/student/aoc/01/input/
declare -a pwdArray=()
readarray -t pwdArray <./input2.txt 
echo ${pwdArray[*]} 
d=${#pwdArray[@]} 
pass=1 
a=0
for (( a<d  ));
do
        b=$(( a+1 ))
        c=$(( b+1 ))
        echo ${pass} 
        freq=${pwdArray[$a]}
        policy=${pwdArray[$b]}
        pword=${pwdArray[$c]}
        echo $freq $policy $pword
        a=$((c+1))
done
