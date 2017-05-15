#!/bin/bash
export HOST="http://admin:password@127.0.0.1:5984"

time for x in {1..100}; do

    echo $x
    DATETIME=`date +%Y%m%d-%H:%M:%S`
    curl -s -H "Content-Type: application/json" -v -X POST ${HOST}/${1} -d '{"AnonID":"00001","Query":"www.bagock.co","QueryTime":"'$DATETIME'","ItemRank":null,"ClickURL":"http://myclick.com/click.php","MovieName":"Star War","MediaType":"MP4","MovieDuration":"2hrs:30mins","Location":"anywhere","TestingScope":"Any Scope","ObjectStorage":"OBJ-000368901","Category":"DC-CAT-000987643212H","StreetName":"FutonRoad","StreetNumber":"1059","RepeationTime":"Always","LastSyncHours":"12-30-2015:09:11:30","OpenningDate":"Feb 05"}' > /dev/null 2>&1
	
done  >>/tmp/results