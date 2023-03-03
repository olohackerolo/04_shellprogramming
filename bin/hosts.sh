#!/bin/bash
#   # cat /etc/hosts
#   192.168.10.10  server10.example.com  server10
#   192.168.10.11  server11.example.com  server11
#   .....
#   192.168.10.30  server30.example.com  server30

HOSTS=/etc/hosts
# HOSTS=/root/bin/hosts && > $HOSTS
NET=192.168.10
START=10
END=30

for i in $(seq $START $END)
do
    echo "$NET.$i  server$i.example.com  server$i" >> $HOSTS
done
