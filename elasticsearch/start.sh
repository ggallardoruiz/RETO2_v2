#!/bin/sh
docker rm retoelasticsearch
docker run -p 9200:9200 -p 9300:9300 -P --name retoelasticsearch  -d elasticsearch
