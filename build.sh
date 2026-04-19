#!/bin/bash

IMAGE_NAME=react-devops-app

echo "Building Docker Image..."
docker build -t $IMAGE_NAME .

echo "Tagging Image..."
docker tag $IMAGE_NAME ajaykumar91/dev:$IMAGE_NAME

echo "Pushing to DockerHub DEV..."
docker push ajaykumar91/dev:$IMAGE_NAME