#!/bin/sh -x
# Fail hard and fast
set -eo pipefail

cd ${app}
echo "[${HOSTNAME}] booting container."
/usr/local/bin/confd -onetime -backend env
sh ${app}/start.sh 
echo "exited $0"
