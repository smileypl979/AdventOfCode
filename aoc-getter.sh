#!/bin/bash 
#  from https:/www.henryschmale.org/2020/12/03/advent-code-input-getter.html 

# usage:  
#  1.  You’ll need to get your Advent of Code session id. You can extract this by using the network inspector while in chrome, and grabbing the value of the cookie header. It’s a rather long value.
#  2.  Set my_cookie to this value.
#  3.  Put this function into your .bashrc.
#  3.  Source your updated .bashrc.
#  4.  Run it like ~/src/2020/3 $ get_advent_input > input.txt
#  5.  Remember to redirect your output to where you want to put your program input.
#  6.  You may want to modify the curl command to automatically output to a file, but I didn’t since I want to see the output, or use tee

function get_advent_input() {
    my_cookie="53616c7465645f5f53372570f800bcd75000dd076b52989966c97beb4b72f53f2d5a4eadd1295836d4c01572c6ea6127" # put your cookie here
    url_path_str=$(awk -F/ '{x=$(NF)+0;print $(NF-1) " " x}' <(echo $PWD))
    year=$(cut -f 1 -d" " <(echo $url_path_str))
    day=$(cut -f 2 -d" " <(echo $url_path_str))
    curYear=$(date +%Y)
    if [[ "$day" -ge "1" ]] && [[ "$day" -le "25" ]]
    then
        if [[ "$year" -ge "2015" ]] && [[ "$year" -le "$curYear" ]]
        then
            urlPath="https://adventofcode.com/$year/day/$day/input"
            echo $urlPath >&2
            curl --cookie "$my_cookie" "$urlPath"
        else
            echo "Your dirPath doesn't match a year. CWD must be end with year/day" >&2
        fi
    else
        echo "Your dirPath doesn't match a year. CWD must be end with year/day" >&2
    fi
} 