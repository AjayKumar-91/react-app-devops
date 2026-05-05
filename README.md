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

---

## 📄 docker-compose.yml

```yaml
services:
  react-app:
    container_name: react-dev-container
    build:
      context: .
      dockerfile: Dockerfile
    image: ajaykumar91/react-app-dev
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

---

# ⚙️ Bash Scripts

## 🛠️ build.sh

```bash
#!/bin/bash

IMAGE_NAME=react-devops-app

echo "Building Docker Image..."
docker build -t $IMAGE_NAME .

echo "Tagging Image..."
docker tag $IMAGE_NAME ajaykumar91/dev:$IMAGE_NAME

echo "Pushing to DockerHub DEV..."
docker push ajaykumar91/dev:$IMAGE_NAME
```

---

## 🚀 deploy.sh

```bash
#!/bin/bash

IMAGE_NAME=react-devops-app

echo "Pulling latest image..."
docker pull ajaykumar91/dev:$IMAGE_NAME

echo "Stopping old container..."
docker stop react-container || true
docker rm react-container || true

echo "Running new container..."
docker run -d -p 80:80 --name react-container ajaykumar91/dev:$IMAGE_NAME

echo "Deployment Done!"
```

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
ajaykumar91/devops-build-dev:latest
ajaykumar91/devops-build-prod:latest
```

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

    environment {
        DEV_REPO = "ajaykumar91/devops-build-dev"
        PROD_REPO = "ajaykumar91/devops-build-prod"
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'dev', url: 'https://github.com/AjayKumar-91/react-app-devops.git'
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
                branch 'main'
            }
            steps {
                sh 'docker tag $DEV_REPO $PROD_REPO'
                sh 'docker push $PROD_REPO'
            }
        }

        stage('Deploy') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}

```

---

# ☁️ AWS Deployment

## EC2 Setup

* Instance Type: `t2.micro`
* OS: Ubuntu 20.04

## Security Group Rules

| Type | Port | Source     |
| ---- | ---- | ---------- |
| HTTP | 80   | 0.0.0.0/0  |
| SSH  | 22   | My IP Only |

---

# 📊 Monitoring Setup

## Recommended Tools

* Prometheus
* Grafana
* Uptime Kuma (simple alternative)

## Health Check Endpoint

```
http://<ec2-public-ip>/
```

## Alerting

* Email notifications on downtime
* Slack integration (optional)

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
