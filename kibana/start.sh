#!/bin/sh
docker run -p 5601:5601 -P --link retoelasticsearch:elasticsearch -d kibana
