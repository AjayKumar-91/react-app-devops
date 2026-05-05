pipeline {
    agent any

    environment {
        DEV_REPO  = "ajaykumar91/devops-build-dev"
        PROD_REPO = "ajaykumar91/devops-build-prod"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Detect Branch') {
            steps {
                script {
                    echo "Building branch: ${env.BRANCH_NAME}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh "docker build -t $DEV_REPO:$IMAGE_TAG ."
                    } else if (env.BRANCH_NAME == 'master') {
                        sh "docker build -t $PROD_REPO:$IMAGE_TAG ."
                    }
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh "docker push $DEV_REPO:$IMAGE_TAG"
                    } else if (env.BRANCH_NAME == 'master') {
                        sh "docker push $PROD_REPO:$IMAGE_TAG"
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh """
                        docker stop dev-container || true
                        docker rm dev-container || true
                        docker run -d -p 3001:80 --name dev-container $DEV_REPO:$IMAGE_TAG
                        """
                    }

                    if (env.BRANCH_NAME == 'master') {
                        sh """
                        docker stop prod-container || true
                        docker rm prod-container || true
                        docker run -d -p 3000:80 --name prod-container $PROD_REPO:$IMAGE_TAG
                        """
                    }
                }
            }
        }
    }
}