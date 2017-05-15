#!/bin/bash
{
for x in $(seq 1 $1); do

   echo "Run Job ${x}"
   date +%H:%M:%S
   time /root/test-insert-001.sh ${2} >/dev/null 2>&1 &

done
} 2>&1 | tee -a /tmp/test-run-log-${1}-`date +%d-%m-%Y_%H-%M-%S`.log

LASTLOG=`ls -ltr /tmp/*.log |tail -1 |awk '{print $9}'`
cat $LASTLOG |grep real |awk '{print $2}' > /tmp/runtime_MinSec
echo -e "\n"
echo -n "The total runtime is in (seconds) : "
while read x; do echo $x | awk -Fm '{ print ($1 * 60) + $2 }' ; done < /tmp/runtime_MinSec |sort |tail -1