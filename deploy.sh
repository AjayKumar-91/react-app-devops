#!/bin/bash

set -e

BRANCH=$1
BUILD_NUMBER=$2

DEV_REPO="ajaykumar91/devops-build-dev"
PROD_REPO="ajaykumar91/devops-build-prod"

echo "Starting Deployment..."

if [ -z "$BRANCH" ] || [ -z "$BUILD_NUMBER" ]; then
    echo "Usage: ./deploy.sh <branch> <build_number>"
    exit 1
fi

# DEV DEPLOY
if [ "$BRANCH" == "dev" ]; then

    echo "Deploying DEV application..."

    docker pull $DEV_REPO:$BUILD_NUMBER

    docker stop dev-container 2>/dev/null || true
    docker rm dev-container 2>/dev/null || true

    docker run -d \
        --name dev-container \
        -p 3001:80 \
        $DEV_REPO:$BUILD_NUMBER

# PROD DEPLOY
elif [ "$BRANCH" == "master" ]; then

    echo "Deploying PROD application..."

    docker pull $PROD_REPO:$BUILD_NUMBER

    docker stop prod-container 2>/dev/null || true
    docker rm prod-container 2>/dev/null || true

    docker run -d \
        --name prod-container \
        -p 80:80 \
        $PROD_REPO:$BUILD_NUMBER

else
    echo "Invalid branch name!"
    echo "Use: dev or master"
    exit 1
fi

echo "Deployment Completed Successfully"