#!/bin/bash

SERVICE_FILE=$1
NAMESPACE=$2

docker stack deploy -c /root/.jenkins/workspace/deploy_service/deploy_files/$SERVICE_FILE.yaml $NAMESPACE
