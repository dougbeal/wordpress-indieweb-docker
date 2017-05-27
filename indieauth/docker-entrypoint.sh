#!/bin/sh -x
# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
#trap "echo TRAPed signal" HUP INT QUIT TERM
cd ${app}
echo "tiller_base ${tiller_base} $(find $tiller_base)"
stat ${tiller_base}/common.yaml
tiller -b ${tiller_base} --verbose --debug --environment ${RACK_ENV}
#sh ${app}/start.sh 

echo "exited $0"
