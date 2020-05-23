#!/bin/bash

docker build -t haproxy-challenge:1.0 .
docker stack deploy -c docker-stack.yaml challenge