#!/bin/bash
DATA=../data/*
echo "TillerSystems interview init program"
echo "Please give us your firstname:"
read firstname
echo "Please give us your lastname:"
read lastname
date=`date +%Y%m%d`
lake_hash="$lastname$firstname$date"
lower_hash=`echo "$lake_hash" | tr '[:upper:]' '[:lower:]'`
s3_bucket="https://s3-eu-west-1.amazonaws.com/tillerinterview/"
s3_endpoint="$s3_bucket$lower_hash"
echo "Init the s3 data-lake"
for file in $DATA
do
 ./s3.sh $s3_endpoint $file
done
echo "Data lake created at $s3_endpoint."
echo "Start building containers"
sed "s:{{s3_endpoint}}:$lower_hash:g" ../docker-compose.yml > ../docker-compose.tmp;
mv ../docker-compose.tmp ../docker-compose.yml
docker-compose -f ../docker-compose.yml up -d
echo "We are done."
echo "browse the api on http://0.0.0.0:5000/"
echo "ssh on the python container by running './ssh.sh python'"
