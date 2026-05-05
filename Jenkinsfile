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
                    echo "Branch: ${env.BRANCH_NAME}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t app:${IMAGE_TAG} ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS')]) {

                    sh "echo $PASS | docker login -u $USER --password-stdin"
                }
            }
        }

        stage('Push to Dev Repo') {
            when {
                branch 'dev'
            }
            steps {
                sh "docker tag app:${IMAGE_TAG} ${DEV_REPO}:${IMAGE_TAG}"
                sh "docker tag app:${IMAGE_TAG} ${DEV_REPO}:latest"
                sh "docker push ${DEV_REPO}:${IMAGE_TAG}"
                sh "docker push ${DEV_REPO}:latest"
            }
        }

        stage('Push to Prod Repo') {
            when {
                branch 'main'
            }
            steps {
                sh "docker tag app:${IMAGE_TAG} ${PROD_REPO}:${IMAGE_TAG}"
                sh "docker tag app:${IMAGE_TAG} ${PROD_REPO}:latest"
                sh "docker push ${PROD_REPO}:${IMAGE_TAG}"
                sh "docker push ${PROD_REPO}:latest"
            }
        }

        stage('Deploy') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'main'
                }
            }
            steps {
                sh "chmod +x deploy.sh"
                sh "./deploy.sh"
            }
        }
    }

    post {
        always {
            sh "docker system prune -f || true"
        }
    }
}