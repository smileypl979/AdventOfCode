#!/bin/bash
# cd /home/student/aoc/01/input/
declare -a numArray=()
readarray -t numArray < ./input1 
echo ${numArray[*]} 
c=${#numArray[@]} 
pass=0 
for (( a=0; a<=${c}; a++ )); do 
        echo ${pass} 
        for (( b=0; b<=${c}; b++ )); do 
                num1=${numArray[$a]} 
                num2=${numArray[$b]}
                sum=$((num1+num2))
                if (( $sum == 2020 )); then
                        echo ${num1} ${num2} ${sum}
                        product=$((num1*num2))
                        echo ${product}
                        break;
                else
                        pass=$((pass+1));
                fi 
        done
done