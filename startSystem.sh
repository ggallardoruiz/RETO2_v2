#!/bin/bash
echo __________ Start The Complete System_________
echo START DB
cd DB
./start.sh
cd ..

sleep 25
cd server_python
echo start web Server
./start.sh
cd ..

sleep 5
echo START LOAD
cd load
./start.sh

sleep 5
echo Estic Search
cd ../elasticsearch
./start.sh

sleep 15
echo START LogStats
cd ../logstash
./start.sh

sleep 5
echo Kibana
cd ../kibana
./start.sh

echo END SCRIPT________
