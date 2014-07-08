#bin/bash

su check_mk_status -c date > /dev/null

LOGIN_STATUS=`echo $?`

if [[ $LOGIN_STATUS != "0" ]];
then
        echo "2 freeipa-Login - CRITICAL - Unable to login"
else
        echo "0 freeipa-Login - OK - Able to login"
fi
