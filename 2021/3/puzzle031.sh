#!/bin/bash

reading=()
declare -a reading
declare -a thisarray
declare -a digit
declare -a gamma
gammastring=""
gammatotal=0
declare -a epsilon
epsilonstring=""
epsilontotal=0
count=0
j=0
while read line; do reading+=("$line") ; done < input.txt
# echo ${reading[@]}
# echo ${#reading[@]}
j=$(( ${#reading[@]} ))
r=$(( $j/2 ))
length=$(( ${#reading[0]}-1 ))
for (( i=0; $i<$j; i++ ))
do 
    thiscode=${reading[$i]}
    for (( k=0; k<${#thiscode}; k++ )); do thisarray[$k]="${thiscode:$k:1}"; done
    for (( l=0; l<=$length; l++ )); do
	if [ ${thisarray[$l]} == "1" ]; then digit[$l]=$(( ${digit[$l]}+1 )); fi
    done
done 
for (( l=0; l<=$length; l++ )); do
	# if [ ${digit[$l]} -gt $r ]; then gamma[$l]=1 && epsilon[$l]=0
	# else gamma[$l]=0 && epsilon[$l]=1; fi
	if [ ${digit[$l]} -gt $r ]; then gammastring+="1" && epsilonstring+="0"
	else epsilonstring+="1" && gammastring+="0" 
	fi
done
echo $gammastring
echo $epsilonstring
g=$( echo "$(( 2#$gammastring ))" )
e=$( echo "$(( 2#$epsilonstring ))" )

echo "gamma = $g"
echo "epsilon = $e"

echo $(( $g*$e ))









# echo ${gamma[@]}
# for (( l=0; l<=$length; l++ )); do
#	x=$(( $length-$l ))
#	b=$( echo '2^$x' | bc )
#	c=$(( $gammatotal*$b ))
#	gammatotal=$(( $gammatotal+$c ))
#done
#echo $gammatotal
#echo ${epsilon[@]}
#for (( l=0; l<=$length; l++ )); do
#        x=$(( $length-$l ))
#	b=$( echo '2^$x' | bc )
#	c=$(( $gammatotal*$b ))
#        epsilontotal=$(( $epsilontotal+$c ))
#done
#echo $epsilontotal
#
#echo $(( $gammatotal*$epsilontotal ))
#
#
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

