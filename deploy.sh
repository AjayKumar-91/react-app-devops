#!/bin/bash

set -e

BRANCH=$1
BUILD_NUMBER=$2

DEV_REPO="ajaykumar91/devops-build-dev"
PROD_REPO="ajaykumar91/devops-build-prod"

echo "Starting Deployment..."

if [ "$BRANCH" == "dev" ]; then

    REPO=$DEV_REPO
    CONTAINER="dev-container"
    PORT=3001

elif [ "$BRANCH" == "master" ]; then

    REPO=$PROD_REPO
    CONTAINER="prod-container"
    PORT=80

else
    echo "Invalid branch"
    exit 1
fi

docker pull $REPO:$BUILD_NUMBER

docker stop $CONTAINER || true
docker rm $CONTAINER || true

docker run -d --restart always --name $CONTAINER -p $PORT:80 $REPO:$BUILD_NUMBER

echo "Deployment completed"