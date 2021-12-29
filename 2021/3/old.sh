#!/bin/bash

reading=()
declare -a reading
gamma="00000"
epsilon="00000"
i=0
j=0
a=0 && b=0 && c=0 && d=0 && e=0
while read line; do ${reading[$i]}=$line && i=$((i+1)) ; done < test-input.txt
echo ${reading[@]}
j=$(( ${#reading[@]} ))
r=$(( $j/2 ))
for (( i=0; $i<$j; i++ ))
do 
    thiscode=${reading[$i]}
    declare -a thisarray
    for (( k=0; k<${#thiscode}; k++ )); do thisarray[$k]="${thiscode:$k:1}"; done
    declare -p thisarray 
done 


# a=$(( i-2 ))
# while [ $j -lt $t ]; do
#    b=$((a+1)) && c=$((a+2))
#    sum1=$(( ${reading[$a]}+${reading[$b]}+${reading[$c]} )) && a=$((a+1)) && b=$((a+1)) && c=$((a+2))
#    sum2=$(( ${reading[$a]}+${reading[$b]}+${reading[$c]} ))
#    if [ $sum2 -gt $sum1 ]
#    then deeper=$((deeper+1)) && echo $deeper
#    fi
# done
