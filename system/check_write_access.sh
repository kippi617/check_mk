#!/bin/bash

HOST=`hostname -s`
LOCATION_LIST=`/bin/df -kP | fgrep / | awk '{ print $6 }' | egrep -iv '^(/mnt/ram|/dev/shm|/boot)'`

for LOCATION in $LOCATION_LIST
do
        /bin/touch $LOCATION/.testfile.$HOST && /bin/rm $LOCATION/.testfile.$HOST
        EXITCODE=$?
        if [[ $EXITCODE == '0' ]]; then
                echo "0 write-access-$LOCATION - OK - $LOCATION"
        else
                echo "2 write-access-$LOCATION - CRITICAL - $LOCATION"
        fi
done
