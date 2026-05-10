#!/bin/bash

set -e

BRANCH=$1
BUILD_NUMBER=$2

DEV_REPO="ajaykumar91/devops-build-dev"
PROD_REPO="ajaykumar91/devops-build-prod"

echo "Starting Deployment..."

if [ "$BRANCH" == "dev" ]; then

    echo "Deploying DEV application..."

    docker pull $DEV_REPO:$BUILD_NUMBER

    docker stop dev-container || true
    docker rm dev-container || true

    docker run -d \
    --name dev-container \
    -p 80:80 \
    $DEV_REPO:$BUILD_NUMBER

fi

if [ "$BRANCH" == "master" ]; then

    echo "Deploying PROD application..."

    docker pull $PROD_REPO:$BUILD_NUMBER

    docker stop prod-container || true
    docker rm prod-container || true

    docker run -d \
    --name prod-container \
    -p 80:80 \
    $PROD_REPO:$BUILD_NUMBER

fi

echo "Deployment Completed Successfully"