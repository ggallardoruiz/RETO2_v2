#!/bin/bash
containers=$(docker ps -q)
echo $containers
docker kill $containers
