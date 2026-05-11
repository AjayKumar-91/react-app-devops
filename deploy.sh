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
    PORT=3000

else
    echo "Invalid branch"
    exit 1
fi

docker pull $REPO:$BUILD_NUMBER

docker stop $CONTAINER || true
docker rm $CONTAINER || true

OLD_CONTAINER=$(docker ps -q --filter publish=$PORT)

if [ -n "$OLD_CONTAINER" ]; then
    docker stop $OLD_CONTAINER
    docker rm $OLD_CONTAINER
fi

docker run -d \
--restart always \
--name $CONTAINER \
-p $PORT:80 \
$REPO:$BUILD_NUMBER

echo "Deployment completed"