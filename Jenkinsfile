pipeline {
    agent any

    environment {
        DEV_REPO  = "ajaykumar91/devops-build-dev"
        PROD_REPO = "ajaykumar91/devops-build-prod"
        IMAGE_TAG = "${env.BUILD_NUMBER}"
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
                    echo "Branch: ${env.BRANCH_NAME ?: env.GIT_BRANCH}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def branch = env.BRANCH_NAME ?: env.GIT_BRANCH

                    if (branch.contains('dev')) {
                        sh "docker build -t ${DEV_REPO}:${IMAGE_TAG} ."
                    } else if (branch.contains('master')) {
                        sh "docker build -t ${PROD_REPO}:${IMAGE_TAG} ."
                    }
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'DockerHub_Credentials',
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
                    def branch = env.BRANCH_NAME ?: env.GIT_BRANCH

                    if (branch.contains('dev')) {
                        sh "docker push ${DEV_REPO}:${IMAGE_TAG}"
                    } else if (branch.contains('master')) {
                        sh "docker push ${PROD_REPO}:${IMAGE_TAG}"
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    def branch = env.BRANCH_NAME ?: env.GIT_BRANCH

                    if (branch.contains('dev')) {
                        sh """
                        docker stop dev-container || true
                        docker rm dev-container || true
                        docker run -d -p 3001:80 --name dev-container ${DEV_REPO}:${IMAGE_TAG}
                        """
                    }

                    if (branch.contains('master')) {
                        sh """
                        docker stop prod-container || true
                        docker rm prod-container || true
                        docker run -d -p 3000:80 --name prod-container ${PROD_REPO}:${IMAGE_TAG}
                        """
                    }
                }
            }
        }
    }
}