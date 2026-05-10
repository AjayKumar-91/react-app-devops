#!/bin/bash

set -e

BRANCH=$1
BUILD_NUMBER=$2

DEV_REPO="ajaykumar91/devops-build-dev"
PROD_REPO="ajaykumar91/devops-build-prod"

echo "Starting Build..."

if [ "$BRANCH" == "dev" ]; then

    REPO=$DEV_REPO

elif [ "$BRANCH" == "master" ]; then

    REPO=$PROD_REPO

else
    echo "Invalid branch"
    exit 1
fi

docker build -t $REPO:$BUILD_NUMBER .

echo "Pushing image..."
docker push $REPO:$BUILD_NUMBER

echo "Build completed"