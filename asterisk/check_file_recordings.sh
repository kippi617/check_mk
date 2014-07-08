#!/bin/bash

# This will check /dev/shm for files over 100MB

# Temp location to keep file names

TMP_COUNT="/usr/lib/check_mk_agent/plugins/Recording_File_Size"

# Before we do any checks we should check that the directory exists

if [ -d "/dev/shm/" ]
then
        LIST=`find /dev/shm -size +100M -printf "%f\n"> $TMP_COUNT`
        LIST_TOTAL=`wc -l $TMP_COUNT | cut -d ' ' -f1`
        FILE_LIST=`cat $TMP_COUNT | sed ':a;N;$!ba;s/\n/ \/ /g' `
else
        echo "2 Recording_File_Size - CRITICAL - Missing /dev/shm"
        exit
fi

if [[ "$LIST_TOTAL" -gt "1" ]];
then
        echo "2 Recording_File_Size - CRITICAL - Calls over 100M size - $FILE_LIST - $LIST_TOTAL | calls=$LIST_TOTAL"
else
        echo "0 Recording_File_Size - OK - No calls over 100MB | calls=$LIST_TOTAL"
fi

