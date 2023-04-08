#!/bin/bash

docker build \
    --build-arg LATEX_PROJECT_NAME=$LATEX_PROJECT_NAME \
    --build-arg USER_ID=$(id -u) \
    --build-arg GROUP_ID=$(id -g) \
    -t $LATEX_PROJECT_NAME .
