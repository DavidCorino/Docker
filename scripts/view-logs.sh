#!/bin/bash

SERVICE_NAME=$1

docker service logs $SERVICE_NAME
