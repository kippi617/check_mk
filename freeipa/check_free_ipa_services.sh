#!/bin/bash

# Get the status of freeipa

SERVICES=`/etc/init.d/ipa status | cut -d ':' -f2`

for i in `echo $SERVICES | cut -d ':' -f2`
do
        if [[ $i != "RUNNING" ]];
        then
                echo "2 freeipa-Service - CRITICAL - Services"
                exit
        else
                echo "0 freeipa-Service - OK - Services"
        fi
done
