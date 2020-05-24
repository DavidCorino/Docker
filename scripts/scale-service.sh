#!/bin/bash

SERVICE_NAME=$1
REPLICAS=$2

docker service scale $SERVICE_NAME=$REPLICAS
