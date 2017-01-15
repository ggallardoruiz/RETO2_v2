#!/bin/sh

mkfifo /tmp/stats_fifo
node /root/stats_generator.js < /tmp/stats_fifo > /shared/server_stats.log &
nohup dstat --epoch --cpu --mem --net  --float --output /tmp/stats_fifo > /dev/null 2>&1 &

if [ ! -z ${THEDB+x} ]; then sed -i.bak s/reto1db/$THEDB/ /root/dummy-web-server.py ; fi

python /root/dummy-web-server.py
