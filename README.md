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
