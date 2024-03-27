#!/bin/sh

ip_suffix=147.102.
ifconfig_output=$(ifconfig | grep $ip_suffix)

for word in $ifconfig_output; 
do 
    if [[ $word == $ip_suffix* ]] && [[ $word != *.255 ]];
    then
        echo $word; 
    fi
done