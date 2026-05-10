#!/bin/bash

set -e

BRANCH=$1
BUILD_NUMBER=$2

DEV_REPO="ajaykumar91/devops-build-dev"
PROD_REPO="ajaykumar91/devops-build-prod"

echo "Starting Docker Build..."

if [ -z "$BRANCH" ] || [ -z "$BUILD_NUMBER" ]; then
    echo "Usage: ./build.sh <branch> <build_number>"
    exit 1
fi

# DEV BUILD
if [ "$BRANCH" == "dev" ]; then

    echo "Building DEV image..."

    docker build -t $DEV_REPO:$BUILD_NUMBER .
    docker tag $DEV_REPO:$BUILD_NUMBER $DEV_REPO:latest

    echo "Pushing DEV image..."

    docker push $DEV_REPO:$BUILD_NUMBER
    docker push $DEV_REPO:latest

# PROD BUILD
elif [ "$BRANCH" == "master" ]; then

    echo "Building PROD image..."

    docker build -t $PROD_REPO:$BUILD_NUMBER .
    docker tag $PROD_REPO:$BUILD_NUMBER $PROD_REPO:latest

    echo "Pushing PROD image..."

    docker push $PROD_REPO:$BUILD_NUMBER
    docker push $PROD_REPO:latest

else
    echo "Invalid branch name!"
    echo "Use: dev or master"
    exit 1
fi

echo "Docker Build Completed Successfully"