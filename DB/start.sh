#!/bin/sh
docker rm reto1db
sudo docker run --cpu-period=50000 --cpu-quota=10000 --cpuset-cpus="0" --name reto1db -e MYSQL_ROOT_PASSWORD=passwd -p 3306:3306 -d reto1db
