#!/bin/bash

function getoxygen() {
	echo "entering getoxygen function"
	inputfile=$1
	criteria=$2
	echo "This is the inputfile: $inputfile"
	echo "This is the criteria: $criteria"
	declare -a bitcriteria
	declare -a o2array
	o2readings=$( sort -r $inputfile )
	o2array=($o2readings)
	echo "This is the o2array:  ${o2array[@]}"
	j=$(( ${#o2array[@]}-1 ))
	h=$(( ${#o2array[@]}/2 ))
	length=$(( ${#reading[0]} ))
	limit=$(($length-1))
	for (( l=0; l<=$limit; l++ )); do bitcriteria[$l]="${criteria:$l:1}"; done
	echo "This is the bit crieteria: ${bitcriteria[@]}"
	bitnum=0
	while [ $bitnum -lt $limit ]
	do
		echo "This is the limit: $limit"
		echo "This is the bit number: $bitnum"
		for (( n=$j; $n>=0; n-- ))
		do
			o2arraynow=${#o2array[@]}
			if [ $o2arraynow -gt 2 ]; then
				thiso2reading=${o2array[$n]}
				for (( k=0; k<$length; k++ )); do o2reading[$k]="${thiso2reading:$k:1}"; done
				if [ "${o2reading[$bitnum]}" != "${bitcriteria[$bitnum]}" ]; then unset 'o2array[$n]' ;fi
			elif [ $o2arraynow -lt 2 ]; then
				echo "There can be only one: ${o2array[@]}"
			else
				echo "This is the count of elements in o2array:  $o2arraynow"
				echo "These are the elements in o2array:  ${o2array[@]}"
				echo "This is the first o2array element: ${o2array[0]}"
				thiso2reading=${o2array[0]}
		                echo "thiso2reading0 = $thiso2reading"
                		for (( k=0; k<$length; k++ )); do o2reading[$k]="${thiso2reading:$k:1}"; done
		                if [ "${o2reading[$limit]}" != "1" ]; then 
                		        unset 'o2array[0]' 
		                else unset 'o2array[1]'; fi
			fi
		done
		bitnum=$(($bitnum+1))
	done
	# systematically filter out readings based on their bit criteria
#	echo ${o2array[@]}
#	if [ ${#o2array[@]} -eq "2" ]; then
#		thiso2reading=${o2array[0]}
#		echo "thiso2reading0 = $thiso2reading"
 #               for (( k=0; k<$length; k++ )); do o2reading[$k]="${thiso2reading:$k:1}"; done
#		if [ "${o2reading[$limit]}" != "1" ]; then 
#			unset 'o2array[0]' 
#		else unset 'o2array[1]'; fi
#	else echo "There was an error, the length of o2array = ${#o2array[@]}"
#	fi
	echo "This is the o2 entry:  ${o2array[@]}"
}

####################################################################################################
# Main Code
read -p "Which input file for use? " inputfile
declare -a reading
declare -a thisarray
declare -a digit
declare -a gamma
declare -a scrubber
gammastring=""
gammatotal=0
declare -a epsilon
epsilonstring=""
epsilontotal=0
count=0
j=0
while read line; do reading+=("$line") ; done < $inputfile
# echo ${reading[@]}
# echo "This is the count of readings: ${#reading[@]}"
j=$(( ${#reading[@]} ))
r=$(( $j/2 ))
# echo "This is r $r"
length=$(( ${#reading[0]}-1 ))

echo "Entering poweruse function"
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
                if [ ${digit[$l]} -ge $r ]; then gammastring+="1" && epsilonstring+="0"
                else epsilonstring+="1" && gammastring+="0"
                fi
        done
        echo "This is Gammastring: $gammastring"
        echo $epsilonstring
        g=$( echo "$(( 2#$gammastring ))" )
        e=$( echo "$(( 2#$epsilonstring ))" )
        echo "The power consumption rate is $(( $g*$e ))"
	mostcommonbits=$gammastring

getoxygen $inputfile $mostcommonbits
# getco2









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

