pipeline {
    agent any

    environment {
        DEV_REPO = "ajaykumar91/react-app-dev"
        PROD_REPO = "ajaykumar91/react-app-prod"
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'dev', url: 'https://github.com/AjayKumar-91/devops-react-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DEV_REPO .'
            }
        }

        stage('Push to Dev Repo') {
            when {
                branch 'dev'
            }
            steps {
                sh 'docker push $DEV_REPO'
            }
        }

        stage('Push to Prod Repo') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker tag $DEV_REPO $PROD_REPO'
                sh 'docker push $PROD_REPO'
            }
        }

        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}