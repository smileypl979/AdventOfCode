#!/bin/bash
# cd /home/student/aoc/01/input/
declare -a numArray=()
readarray -t numArray < ./input1 
echo ${numArray[*]} 
d=${#numArray[@]} 
pass=0 
for (( a=0; a<=${d}; a++ )); do 
        echo ${pass} 
        for (( b=0; b<=${d}; b++ )); do 
            for (( c=0; c<=${d}; c++ )); do
                num1=${numArray[$a]} 
                num2=${numArray[$b]}
                num3=${numArray[$c]}
                sum=$((num1+num2+num3))
                if (( $sum == 2020 )); then
                        echo ${num1} ${num2} ${num3} ${sum}
                        product=$((num1*num2*num3))
                        echo ${product}
                        break;
                else
                        pass=$((pass+1));
                fi 
            done
        done
done