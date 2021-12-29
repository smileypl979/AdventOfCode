#!/bin/bash

reading=()
declare -a reading
declare -a thisarray
declare -a digit
declare -a gamma
declare -a epsilon
count=0
j=0
a=0 && b=0 && c=0 && d=0 && e=0
while read line; do reading+=("$line") ; done < test-input.txt
# echo ${reading[@]}
# echo ${#reading[@]}
j=$(( ${#reading[@]} ))
r=$(( $j/2 ))
for (( i=0; $i<$j; i++ ))
do 
    thiscode=${reading[$i]}
    for (( k=0; k<${#thiscode}; k++ )); do thisarray[$k]="${thiscode:$k:1}"; done
    for (( l=0; l<=4; l++ )); do
	if [ ${thisarray[$l]} == "1" ]; then digit[$l]=$(( ${digit[$l]}+1 )); fi
    done
done 
for (( l=0; l<=4; l++ )); do
	check=$(( ${digit[$l]}/$r ))
	if [ ${digit[$l]} -ge $r ]; then gamma[$l]=1 && epsilon[$l]=0
	else gamma[$l]=0 && epsilon[$l]=1; fi
done








echo ${gamma[@]}
gammatotal=$(( (${gamma[0]}*16)+(${gamma[1]}*8)+(${gamma[2]}*4)+(${gamma[3]}*2)+(${gamma[4]}*1) ))
echo $gammatotal
echo ${epsilon[@]}
epsilontotal=$(( (${epsilon[0]}*16)+(${epsilon[1]}*8)+(${epsilon[2]}*4)+(${epsilon[3]}*2)+(${epsilon[4]}*1) ))
echo $epsilontotal
echo $(( $gammatotal*$epsilontotal ))


# echo ${digit[@]}

# echo $a $b $c $d $e


# a=$(( i-2 ))
# while [ $j -lt $t ]; do
#    b=$((a+1)) && c=$((a+2))
#    sum1=$(( ${reading[$a]}+${reading[$b]}+${reading[$c]} )) && a=$((a+1)) && b=$((a+1)) && c=$((a+2))
#    sum2=$(( ${reading[$a]}+${reading[$b]}+${reading[$c]} ))
#    if [ $sum2 -gt $sum1 ]
#    then deeper=$((deeper+1)) && echo $deeper
#    fi
# done

# if [ $l -eq 0 ]; then
#                if [ ${thisarray[$l]} == "1" ]; then a=$(($a+1)); fi
#        elif [ $l -eq 1 ]; then
#                if [ ${thisarray[$l]} == "1" ]; then b=$(($b+1)); fi
#        elif [ $l -eq 2 ]; then
#                if [ ${thisarray[$l]} == "1" ]; then c=$(($c+1)); fi
#        elif [ $l -eq 3 ]; then
#                if [ ${thisarray[$l]} == "1" ]; then d=$(($d+1)); fi
#        elif [ $l -eq 4 ]; then
#                if [ ${thisarray[$l]} == "1" ]; then e=$(($e+1)); fi
#        fi

