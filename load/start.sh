#!/bin/sh
RATE=${RATE:-1}
HITS=${HITS:-1}
docker rm reto1load
if [ -z ${THESERVER+x} ]; then 
  docker run --link reto1server -e "RATE=$RATE" -e "HITS=$HITS" -P -p 8091:8091 --name reto1load -d reto1load
else
  docker run -e "THESERVER=$THESERVER" -e "RATE=$RATE" -e "HITS=$HITS" -P -p 8091:8091 --name reto1load -d reto1load
fi
