# 🚀 DevOps Application Deployment (React App CI/CD Pipeline)

This project demonstrates a complete **DevOps lifecycle implementation** including Dockerization, CI/CD using Jenkins, Git branching strategy, AWS deployment, and monitoring.

---

# 📌 Project Overview

* **Application:** React-based frontend application
* **Goal:** Deploy application in production-ready environment using DevOps tools
* **Port:** 80 (HTTP)
* **Deployment Platform:** AWS EC2 (t2.micro)

---

# 📂 Repository

* 🔗 Source Code: [https://github.com/sriram-R-krishnan/devops-build](https://github.com/sriram-R-krishnan/devops-build)

---

# 🏗️ Architecture Flow

```
GitHub (dev/master)
        ↓
     Jenkins CI/CD
        ↓
   Docker Build Image
        ↓
Docker Hub (dev / prod repos)
        ↓
   AWS EC2 Instance
        ↓
   Docker Container (Port 80)
        ↓
     Users Access App
```


# local run application
```bash
npm install -g serve
sudo npx serve -s build -l 80
OR
npx serve -s build -l tcp://0.0.0.0:5000
```

<img width="1918" height="1017" alt="image" src="https://github.com/user-attachments/assets/80236e91-fd22-431e-a081-8ab9de5d2fc0" />

---

# Create EC2 instance and SSH access
<img width="1918" height="1007" alt="image" src="https://github.com/user-attachments/assets/7a1e54d2-57bf-40e4-8090-54d056dcef1a" />
<img width="1918" height="968" alt="image" src="https://github.com/user-attachments/assets/3351579f-779a-4130-af4d-884776300e93" />
<img width="1918" height="976" alt="image" src="https://github.com/user-attachments/assets/4a4c03a8-62cc-4f24-a979-25a30f0b6382" />
<img width="1918" height="972" alt="image" src="https://github.com/user-attachments/assets/d0e0193c-bb68-41a5-8d0a-8811cbd095dc" />
<img width="1918" height="966" alt="image" src="https://github.com/user-attachments/assets/633995ce-4233-4151-bf25-89cdae8901df" />
<img width="1918" height="977" alt="image" src="https://github.com/user-attachments/assets/965d12c5-e2d6-4f4d-85a9-ea73b645cf7a" />
<img width="1907" height="965" alt="image" src="https://github.com/user-attachments/assets/c2bebbab-2c44-4a01-b7d3-7ce8031fca42" />
<img width="1917" height="967" alt="image" src="https://github.com/user-attachments/assets/07e5ff0e-bbc8-419f-87ab-12b8dd69a6de" />
<img width="1917" height="967" alt="image" src="https://github.com/user-attachments/assets/4725600f-f8bb-4516-8db3-53a1793f6fe5" />
<img width="1918" height="1025" alt="image" src="https://github.com/user-attachments/assets/49ba0669-33fe-4cb7-8ac2-5c4df231f263" />

---

# Setup Jenlkins & Docker
```
sudo apt update -y
sudo apt upgrade -y
sudo apt install fontconfig openjdk-21-jre -y
java -version

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y

sudo systemctl enable jenkins
sudo systemctl start jenkins

sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins
newgrp docker
sudo systemctl restart jenkins


docker --version
sudo apt install docker-compose-v2 -y
docker compose version

docker compose up
docker compose up -d

java -version
jenkins --version
docker --version
docker compose version
```
---
<img width="1918" height="545" alt="image" src="https://github.com/user-attachments/assets/cfdc247b-2821-4005-8eed-b42f3bab26d5" />
<img width="1918" height="728" alt="image" src="https://github.com/user-attachments/assets/dc76e806-5805-414c-a7f4-31904703737e" />
<img width="1918" height="962" alt="image" src="https://github.com/user-attachments/assets/77009f3b-4292-41c1-98fd-2602bf7ddb4e" />
<img width="1918" height="968" alt="image" src="https://github.com/user-attachments/assets/4bc66ac5-4156-4113-b876-b66a34cc32b9" />
<img width="1918" height="967" alt="image" src="https://github.com/user-attachments/assets/498f448c-c589-4319-b0b9-63f06d750160" />

<img width="1918" height="976" alt="image" src="https://github.com/user-attachments/assets/0dc4f693-6239-4744-bbf8-cbf62616f157" />
<img width="1918" height="970" alt="image" src="https://github.com/user-attachments/assets/52dd8232-3fe9-4780-9ba1-06f820e3a1ac" />
<img width="1918" height="977" alt="image" src="https://github.com/user-attachments/assets/0701f0aa-2fc6-4b7d-94cb-20d75c6c43ac" />
<img width="1918" height="962" alt="image" src="https://github.com/user-attachments/assets/5c580d37-185d-4864-bd5d-495cd730f819" />
<img width="1918" height="863" alt="image" src="https://github.com/user-attachments/assets/495c904c-3402-42b7-aeda-052ae2ed60fa" />
<img width="1918" height="973" alt="image" src="https://github.com/user-attachments/assets/fa02762c-d0c1-428c-be85-ffc30bb48da6" />
<img width="1918" height="962" alt="image" src="https://github.com/user-attachments/assets/ef93808c-9edb-4f08-b9ff-463b48c8d0a6" />
<img width="1915" height="965" alt="image" src="https://github.com/user-attachments/assets/0046f50f-5f87-4d51-9b9d-d2da17feec9a" />
<img width="1918" height="967" alt="image" src="https://github.com/user-attachments/assets/c5c70745-29a9-4125-aaed-381f8e8e9695" />
<img width="1918" height="986" alt="image" src="https://github.com/user-attachments/assets/7334b7d1-21a5-4876-ae65-68d269edf444" />
<img width="1918" height="960" alt="image" src="https://github.com/user-attachments/assets/cc08156e-bf1b-4ec2-bcdb-f76989d3adf5" />


---
# Clone my own repo in ec2

<img width="1918" height="425" alt="image" src="https://github.com/user-attachments/assets/5de90c99-3ee8-4364-83d1-e236f18b845d" />

---

# 🐳 Docker Setup

## 📄 Dockerfile

```dockerfile
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY build/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

# Docker Setup Build Image
```bash
docker build -t react-devops-app .
```
# Rebuild clean
```bash
docker build --no-cache -t react-devops-app .
```
# Dockerfile run containers
```bash
docker run -d -p 80:80 react-devops-app
docker run -d --name react-app-container -p 80:80 react-devops-app
```

# OR

# Run Application on Port 80
```bash
docker build -t react-devops-app .
docker run -d -p 80:80 --name react-app-container react-devops-app
```
<img width="1918" height="707" alt="image" src="https://github.com/user-attachments/assets/7c0ffda9-689a-48ea-9950-a7800996f4ce" />
<img width="1917" height="1012" alt="image" src="https://github.com/user-attachments/assets/2bf40c74-9baa-4ded-b183-6eef91450137" />
<img width="1918" height="1021" alt="image" src="https://github.com/user-attachments/assets/19979241-df7a-4024-970c-0d6ab03006b1" />

---

## 📄 docker-compose.yml

```yaml
services:
  react-app:
    container_name: react-dev-container
    build:
      context: .
      dockerfile: Dockerfile
    image: ajaykumar91/react-app-dev:${BUILD_NUMBER}
    ports:
      - "80:80"
    restart: always
    networks:
      - monitoring  
    healthcheck:
      test: ["CMD-SHELL", "wget -qO- http://localhost || exit 1"]
      interval: 30s
      timeout: 10s
      retries: 3

networks:
  monitoring:
    driver: bridge
```
<img width="1918" height="676" alt="image" src="https://github.com/user-attachments/assets/619ae8bf-ad1a-4238-b26e-430c1706a9b3" />

<img width="1918" height="973" alt="image" src="https://github.com/user-attachments/assets/d0db60a0-bfa8-4f2b-8e03-e18df249da87" />

---

# ⚙️ Bash Scripts

## 🛠️ build.sh

```bash
#!/bin/bash
set -e
BRANCH=$1
BUILD_NUMBER=$2

DEV_REPO="ajaykumar91/devops-build-dev"
PROD_REPO="ajaykumar91/devops-build-prod"
echo "Starting Build..."

if [ "$BRANCH" == "dev" ]; then
    REPO=$DEV_REPO
elif [ "$BRANCH" == "master" ]; then
    REPO=$PROD_REPO
else
    echo "Invalid branch"
    exit 1
fi

docker build -t $REPO:$BUILD_NUMBER .
echo "Pushing image..."
docker push $REPO:$BUILD_NUMBER
echo "Build completed"
```
<img width="1918" height="1008" alt="image" src="https://github.com/user-attachments/assets/aeb6d532-ad6f-43c9-88ac-bc128be802c6" />
<img width="1918" height="476" alt="image" src="https://github.com/user-attachments/assets/4d1abc49-a043-44f3-b22e-34c6ce729181" />


---

## 🚀 deploy.sh

```bash
#!/bin/bash
set -e
BRANCH=$1
BUILD_NUMBER=$2

DEV_REPO="ajaykumar91/devops-build-dev"
PROD_REPO="ajaykumar91/devops-build-prod"

echo "Starting Deployment..."

if [ "$BRANCH" == "dev" ]; then

    REPO=$DEV_REPO
    CONTAINER="dev-container"
    PORT=3001

elif [ "$BRANCH" == "master" ]; then

    REPO=$PROD_REPO
    CONTAINER="prod-container"
    PORT=80

else
    echo "Invalid branch"
    exit 1
fi

docker pull $REPO:$BUILD_NUMBER
docker stop $CONTAINER || true
docker rm $CONTAINER || true

docker run -d --name $CONTAINER -p $PORT:80 $REPO:$BUILD_NUMBER
echo "Deployment completed"
```
<img width="1915" height="1022" alt="image" src="https://github.com/user-attachments/assets/0bb9d0e6-8068-4582-a6af-36ec285cfe8f" />
<img width="1918" height="1012" alt="image" src="https://github.com/user-attachments/assets/718a889a-6565-44f7-8447-0194b776f8d0" />

---

# 🔀 Git Version Control Strategy

## Branching Model

* `dev` → Development branch
* `master` → Production branch

## Git Commands

```bash
git init
git checkout -b dev
git add .
git commit -m "initial commit"
git push origin dev
```
<img width="1918" height="1026" alt="image" src="https://github.com/user-attachments/assets/cdd13816-2c8e-4188-9e9f-6525454c2ed5" />

---

## 📌 Important Files

* `.gitignore`

```
node_modules/
.env
build/
*.log
```

* `.dockerignore`

```
node_modules
.git
.gitignore
Dockerfile
docker-compose.yml
*.log
*.md
```

---

# 🐳 Docker Hub Setup

## Repositories

* 🟢 dev repository → Public
* 🔴 prod repository → Private

## Image Naming Convention

```
docker login
docker build -t ajaykumar91/devops-build-dev:latest .
docker push ajaykumar91/devops-build-dev:latest

docker build -t ajaykumar91/devops-build-prod:latest .
docker push ajaykumar91/devops-build-prod:latest

ajaykumar91/devops-build-dev:latest
ajaykumar91/devops-build-prod:latest
```
<img width="1916" height="958" alt="image" src="https://github.com/user-attachments/assets/d2e718e1-818a-40df-aaa1-2a530fb48db4" />
<img width="1918" height="971" alt="image" src="https://github.com/user-attachments/assets/5ec7db0d-28f3-41c4-90d8-a5e59aec6335" />
<img width="1917" height="973" alt="image" src="https://github.com/user-attachments/assets/71abb5db-b087-415c-aef5-fa79d429920d" />

---

# 🔧 Jenkins CI/CD Pipeline

## 🔌 Setup Steps

1. Install Jenkins
2. Install plugins:

   * Git Plugin
   * Docker Pipeline
   * Blue Ocean (optional)
3. Connect GitHub repo
4. Add webhook for auto trigger

---

## 📄 Jenkinsfile

```groovy
pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                deleteDir()
                checkout scm
            }
        }

        stage('Get Branch Name') {
            steps {
                script {

                    env.BRANCH = env.GIT_BRANCH.tokenize('/').last()

                    echo "Current Branch: ${env.BRANCH}"
                }
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
                sh "./build.sh ${env.BRANCH} ${BUILD_NUMBER}"
            }
        }

        stage('Deploy Application') {
            steps {
                sh "./deploy.sh ${env.BRANCH} ${BUILD_NUMBER}"
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

        always {
            sh 'docker image prune -f'
        }
    }
}

```
<img width="1918" height="967" alt="image" src="https://github.com/user-attachments/assets/3a1c124e-2347-40d3-804a-411108c21bc1" />
<img width="1918" height="972" alt="image" src="https://github.com/user-attachments/assets/6e6dd499-67be-4b80-a3ae-8bc01392cc48" />
<img width="1918" height="970" alt="image" src="https://github.com/user-attachments/assets/1e26d441-78fc-4ea3-881b-9a1b0265b437" />
<img width="1918" height="1023" alt="image" src="https://github.com/user-attachments/assets/b8da3c43-885b-45a8-b9fa-cef7e14033f7" />
<img width="1918" height="963" alt="image" src="https://github.com/user-attachments/assets/dbbb0930-3c92-4ce4-9b5e-5c0e01692b2a" />

---

# ☁️ AWS Deployment

## EC2 Setup

* Instance Type: `t3.micro`
* OS: Ubuntu 24.04

## Security Group Rules

| Type | Port | Source     |
| ---- | ---- | ---------- |
| HTTP | 80   | 0.0.0.0/0  |
| SSH  | 22   | My IP Only |


<img width="1918" height="971" alt="image" src="https://github.com/user-attachments/assets/b0aa5ed1-dda4-4e17-a0f2-523f19628f40" />
<img width="1918" height="977" alt="image" src="https://github.com/user-attachments/assets/1ef5cc3b-2a45-4780-b0df-96d7a4688050" />
<img width="1906" height="633" alt="image" src="https://github.com/user-attachments/assets/571232e4-5996-4944-b1ec-c16918d0c2a4" />
<img width="1918" height="972" alt="image" src="https://github.com/user-attachments/assets/27a4aacd-b123-4f8b-b6ed-d74f5847ab86" />

---

# 📊 Monitoring Setup

## Recommended Tools

* Prometheus
* Grafana
* cAdvisor
* Node Exporter
* Alertmanager

## Health Check Endpoint

```
http://52.23.221.54:9090/targets
```

## Alerting

* Email notifications on downtime
* Slack integration (optional)

# Prometheus
<img width="1917" height="966" alt="image" src="https://github.com/user-attachments/assets/a90c7b57-c230-4700-8871-85fd94647c77" />
<img width="1918" height="983" alt="image" src="https://github.com/user-attachments/assets/943e7ef8-d06a-4206-8bea-97899a08f6f8" />
<img width="1918" height="967" alt="image" src="https://github.com/user-attachments/assets/74032f23-5506-4b1e-a222-1d9e9cc44f31" />
<img width="1918" height="976" alt="image" src="https://github.com/user-attachments/assets/9360a777-06e2-47bf-a05b-b19288424b28" />
<img width="1918" height="661" alt="image" src="https://github.com/user-attachments/assets/65c5025c-a748-4269-9c8a-74d8234d9a03" />
<img width="1917" height="965" alt="image" src="https://github.com/user-attachments/assets/1c19c737-43f9-4cad-8c1f-e8bc636b8f46" />
<img width="1918" height="971" alt="image" src="https://github.com/user-attachments/assets/cd30f68a-7884-4758-b5ac-5dc3996c06ba" />
<img width="1918" height="972" alt="image" src="https://github.com/user-attachments/assets/09613316-cb1a-4a5b-bc34-7ace3a7d0b8a" />
<img width="1918" height="967" alt="image" src="https://github.com/user-attachments/assets/a6a355df-978c-4c9b-b2c8-980af0f7b7a5" />
<img width="1918" height="981" alt="image" src="https://github.com/user-attachments/assets/94ac7e28-6946-4b56-93f1-fddc15ae740c" />
<img width="1918" height="978" alt="image" src="https://github.com/user-attachments/assets/3858db60-e99d-4f99-896d-dbb5eaf03ff7" />
<img width="1918" height="977" alt="image" src="https://github.com/user-attachments/assets/4179146e-974e-4de2-aec5-80fadfa0827f" />

# cAdvisor
<img width="1918" height="967" alt="image" src="https://github.com/user-attachments/assets/28f772ac-3ea6-4b18-8604-88b2d357de59" />
<img width="1918" height="976" alt="image" src="https://github.com/user-attachments/assets/543d4c27-305d-4def-889b-e32364f5856a" />
<img width="361" height="853" alt="image" src="https://github.com/user-attachments/assets/1785fb74-edbd-4ec0-9b82-56b3081090b1" />
<img width="1918" height="962" alt="image" src="https://github.com/user-attachments/assets/01a5ee4f-b4e6-4a6e-aeab-abed0a3a3418" />
<img width="1918" height="953" alt="image" src="https://github.com/user-attachments/assets/da8bb9bb-97e5-4e61-8296-6ae5d92b25e4" />
<img width="1918" height="951" alt="image" src="https://github.com/user-attachments/assets/3f30a5c7-063d-4bcc-9314-d9e236e77a2a" />
<img width="1918" height="952" alt="image" src="https://github.com/user-attachments/assets/b0ae0280-6809-47ae-bbff-97ecf58c0962" />
<img width="1918" height="976" alt="image" src="https://github.com/user-attachments/assets/d5f919ff-be61-4f1e-8be5-dabed3fab941" />

# Grafana
<img width="1916" height="972" alt="image" src="https://github.com/user-attachments/assets/a2f28550-d3f3-40c0-ac27-4cf5b5a6d983" />
<img width="1918" height="973" alt="image" src="https://github.com/user-attachments/assets/3d832108-03b3-4356-b7ed-4c636286816f" />
<img width="1918" height="965" alt="image" src="https://github.com/user-attachments/assets/5b318bb5-cfc4-40d9-8d93-0438b741a6f1" />
<img width="1918" height="965" alt="image" src="https://github.com/user-attachments/assets/103804cf-dcb0-4f27-a06b-b6adc6ac7c34" />
<img width="1916" height="980" alt="image" src="https://github.com/user-attachments/assets/045d1ffe-4ede-4f04-9699-718dee8688fd" />
<img width="1918" height="976" alt="image" src="https://github.com/user-attachments/assets/d73c771e-20ba-4c1b-932c-1206bf692556" />
<img width="1918" height="968" alt="image" src="https://github.com/user-attachments/assets/a4e4ae75-8fd8-4cc2-9cbd-8ef4e3137b57" />
<img width="1918" height="977" alt="image" src="https://github.com/user-attachments/assets/37f3f84f-a729-4e24-bc29-f536684002f9" />
<img width="1912" height="972" alt="image" src="https://github.com/user-attachments/assets/d5665aee-5185-4218-9fca-91933cafe3d6" />


# Alertmanager
<img width="1918" height="968" alt="image" src="https://github.com/user-attachments/assets/cdff28b1-85a2-4ec7-a97e-5086025e4d12" />

---

# 📸 Submission Requirements

Include following screenshots in repo:

* Jenkins dashboard (build + pipeline logs)
* AWS EC2 console + Security Group
* Docker Hub repositories (dev & prod images)
* Running application in browser (port 80)
* Monitoring dashboard status

---

# ✅ Final Deliverables

* GitHub Repository URL
* Deployed Application URL (AWS EC2)
* Docker Image Names (dev & prod)
* Jenkins Pipeline working screenshots
* Monitoring setup proof

---

# 🎯 Outcome

This project demonstrates a complete **CI/CD pipeline using Jenkins + Docker + AWS** with automated deployment based on Git branching strategy
