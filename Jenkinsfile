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

        stage('Set Permissions') {
            steps {
                sh 'chmod +x build.sh'
                sh 'chmod +x deploy.sh'
            }
        }

        stage('Show Branch') {
            steps {
                echo "Current Branch: ${env.BRANCH_NAME}"
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'DockerHub_Credentials',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo "$DOCKER_PASS" | docker login \
                    -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'master'
                }
            }

            steps {
                sh "./build.sh ${env.BRANCH_NAME} ${BUILD_NUMBER}"
            }
        }

        stage('Deploy Application') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'master'
                }
            }

            steps {
                sh "./deploy.sh ${env.BRANCH_NAME} ${BUILD_NUMBER}"
            }
        }
    }

    post {

        success {
            echo 'Pipeline executed successfully!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}