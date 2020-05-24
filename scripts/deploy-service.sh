#!/bin/bash

SERVICE_FILE=$1
NAMESPACE=$2

docker stack deploy -c ../deploy_files/$SERVICE_FILE.yaml $NAMESPACE
