#!/bin/bash


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


get_known_ip_addr()
{
    infile=/home/itzo/melina_conf/known_ip.txt
    while read -r line
    do
        known_ip="$line"
    done < "$infile"
}


get_mail_info()
{
    infile=/home/itzo/melina_conf/messages.txt
    i=0
    IFS=$'\n' 
    while read -r line
    do
        if [[ $i == 0 ]];
        then
            mail_sub="$line"
        fi
        if [[ $i == 1 ]];
        then
            mail_body="$line"
        fi
        i=$(( i + 1 ))
    done < "$infile"
}


update_ip_addr()
{
    echo $1 > /home/itzo/melina_conf/known_ip.txt
}

send_report()
{
    subject=$1
    body=$2
    report=/home/itzo/melina_conf/known_ip.txt
    receiver=i.n.tzortzis@gmail.com
    echo $body | mail -A $report -s $subject $receiver
}

ip_addr=xxx.xxx.xxx.xxx
get_cur_ip_addr
get_known_ip_addr
get_mail_info


if [[ $ip_addr != $known_ip ]];
then
    update_ip_addr $ip_addr
    send_report $mail_sub $mail_body
fi

