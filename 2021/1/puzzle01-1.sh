#!/bin/bash
sonar=()
i=0 && while read line; do ${sonar[$i]}=$line && i=$((i+1)) ; done < input.txt
echo "sonar = " ${#sonar[@]} && echo "i = " $i
j=0 && deeper=0
if [ $i -lt ${#sonar[@]} ]
then 
    while [ $j -lt ${#sonar[@]} ]; 
    do 
        if [ ${sonar[$((j+1))]} -gt ${sonar[$j]} ] 
            then deeper=$(($deeper+1)); j=$((j+1)) && echo $deeper 
            else j=$((j+1)) 
        fi 
    done
else echo "The final answer is " $j  
fi