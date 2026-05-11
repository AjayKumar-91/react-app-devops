pipeline {
    agent any

    environment {
        BRANCH = "master"
    }

    stages {

        stage('Checkout Code') {
            steps {
                deleteDir()

                git branch: "${BRANCH}",
                url: 'https://github.com/AjayKumar-91/react-app-devops.git'
            }
        }

        stage('Set Permissions') {
            steps {
                sh 'chmod +x build.sh'
                sh 'chmod +x deploy.sh'
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
            steps {
                sh "./build.sh ${BRANCH} ${BUILD_NUMBER}"
            }
        }

        stage('Deploy Application') {
            steps {
                sh "./deploy.sh ${BRANCH} ${BUILD_NUMBER}"
            }
        }
    }
}