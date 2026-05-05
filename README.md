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
# Stage 1: Build React App
FROM node:18 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

---

## 📄 docker-compose.yml

```yaml
version: '3.8'
services:
  app:
    image: devops-build:latest
    container_name: react-app
    ports:
      - "80:80"
    restart: always
```

---

# ⚙️ Bash Scripts

## 🛠️ build.sh

```bash
#!/bin/bash

IMAGE_NAME="devops-build"
TAG="latest"

 echo "Building Docker Image..."
 docker build -t $IMAGE_NAME:$TAG .

 echo "Build Completed"
```

---

## 🚀 deploy.sh

```bash
#!/bin/bash

IMAGE_NAME="devops-build"
TAG="latest"
CONTAINER_NAME="react-app"

 echo "Stopping existing container..."
 docker stop $CONTAINER_NAME || true
 docker rm $CONTAINER_NAME || true

 echo "Running new container..."
 docker run -d -p 80:80 --name $CONTAINER_NAME $IMAGE_NAME:$TAG

 echo "Deployment Successful"
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
build/
.env
```

* `.dockerignore`

```
node_modules
npm-debug.log
.git
.gitignore
build
```

---

# 🐳 Docker Hub Setup

## Repositories

* 🟢 dev repository → Public
* 🔴 prod repository → Private

## Image Naming Convention

```
username/devops-build-dev:latest
username/devops-build-prod:latest
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
        DEV_IMAGE = "username/devops-build-dev"
        PROD_IMAGE = "username/devops-build-prod"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/sriram-R-krishnan/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-build .'
            }
        }

        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                sh 'docker tag devops-build $DEV_IMAGE:latest'
                sh 'docker push $DEV_IMAGE:latest'
            }
        }

        stage('Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker tag devops-build $PROD_IMAGE:latest'
                sh 'docker push $PROD_IMAGE:latest'
            }
        }

        stage('Deploy') {
            steps {
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
