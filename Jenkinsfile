pipeline {
    agent any

    environment {
        DEV_REPO  = "ajaykumar91/devops-build-dev"
        PROD_REPO = "ajaykumar91/devops-build-prod"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Set Variables') {
            steps {
                script {
                    env.IMAGE_TAG = "${env.BUILD_NUMBER}"
                    
                    if (env.BRANCH_NAME == 'dev') {
                        env.REPO = env.DEV_REPO
                        env.CONTAINER_NAME = "dev-container"
                        env.PORT = "3001"
                    } else if (env.BRANCH_NAME == 'master') {
                        env.REPO = env.PROD_REPO
                        env.CONTAINER_NAME = "prod-container"
                        env.PORT = "3000"
                    } else {
                        error "Unsupported branch: ${env.BRANCH_NAME}"
                    }

                    echo "Branch: ${env.BRANCH_NAME}"
                    echo "Repo: ${env.REPO}"
                    echo "Tag: ${env.IMAGE_TAG}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${env.REPO}:${env.IMAGE_TAG} ."
            }
        }

        stage('Docker Login') {
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

        stage('Push Docker Image') {
            steps {
                sh """
                docker push ${env.REPO}:${env.IMAGE_TAG}
                docker tag ${env.REPO}:${env.IMAGE_TAG} ${env.REPO}:latest
                docker push ${env.REPO}:latest
                """
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                docker stop ${env.CONTAINER_NAME} || true
                docker rm ${env.CONTAINER_NAME} || true
                docker run -d -p ${env.PORT}:80 --name ${env.CONTAINER_NAME} ${env.REPO}:${env.IMAGE_TAG}
                """
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful for ${env.BRANCH_NAME}"
        }
        failure {
            echo "❌ Build failed"
        }
    }
}