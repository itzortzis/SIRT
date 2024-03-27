#!/bin/sh


get_cur_ip_addr()
{
    ip_suffix=147.102.
    ifconfig_output=$(ifconfig | grep $ip_suffix)

    for token in $ifconfig_output; 
    do 
        if [[ $token == $ip_suffix* ]] && [[ $token != *.255 ]];
        then
            ip_addr=$token; 
        fi
    done
}

ip_addr=xxx.xxx.xxx.xxx
get_cur_ip_addr

echo $ip_addr
