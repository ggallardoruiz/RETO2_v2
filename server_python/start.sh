#!/bin/sh
docker rm reto1server
if [ -z ${THEDB+x} ]; then 
  docker run --cpu-period=50000 --cpu-quota=10000 --cpuset-cpus="0" --link reto1db -i -p 80 --name reto1server -v "$PWD"/../shared:/shared reto1server
else
  docker run --cpu-period=50000 --cpu-quota=10000 --cpuset-cpus="0"  -i -e "THEDB=$THEDB" -p 80 --name reto1server -v "$PWD"/../shared:/shared reto1server
fi
