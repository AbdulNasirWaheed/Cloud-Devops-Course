# 🚀 Jenkins CI/CD Pipeline Setup on AWS EC2

A complete beginner-friendly guide to installing and configuring **Jenkins LTS** on an **AWS EC2 Ubuntu Server**, exposing Jenkins securely over the internet, and preparing the environment for real-world CI/CD pipelines.

---

# 📖 Project Overview

In this project, Jenkins is deployed on an AWS EC2 instance to automate software build, test, and deployment workflows.

This setup follows a real-world DevOps scenario where development teams require a centralized CI/CD server for continuous integration and continuous deployment.

---

# 🏢 Industry Scenario

You are a DevOps Engineer at a mid-sized company.

Your development team wants an automated CI/CD platform using Jenkins hosted on AWS.

Your responsibilities include:

* Launch an EC2 instance
* Install Jenkins
* Configure Java
* Expose Jenkins securely
* Access Jenkins via a browser
* Prepare the environment for future pipelines

---

# 🎯 Objectives

* Understand CI/CD concepts
* Learn Jenkins Architecture
* Launch AWS EC2
* Install Jenkins LTS
* Configure Security Groups
* Access Jenkins on Port 8080
* Configure Nginx Reverse Proxy

---

# 🔄 What is CI/CD?

## Continuous Integration (CI)

Developers push code to GitHub.

CI automatically:

* Builds the project
* Runs tests
* Finds bugs early

---

## Continuous Delivery / Deployment (CD)

After successful builds:

* Deploy applications automatically
* Deliver software faster
* Reduce manual work

Think of CI/CD as a smart software factory that continuously builds and delivers applications.

---

# 🤖 What is Jenkins?

Jenkins is an open-source automation server used for:

* Continuous Integration
* Continuous Delivery
* Build Automation
* Testing
* Deployment

Jenkins supports thousands of plugins including:

* GitHub
* Docker
* Kubernetes
* AWS
* Slack

---

# 🏗 Jenkins Architecture

### Master Node

* Manages jobs
* Schedules builds
* Coordinates agents

### Agent Nodes

* Execute build jobs
* Run tests
* Deploy applications

### Plugins

Extend Jenkins with integrations for modern DevOps tools.

---

# 🧰 Prerequisites

* AWS Account
* Ubuntu 22.04 EC2 Instance
* SSH Key Pair
* Security Group
* Browser
* Internet Connection

---

# 🚀 Step 1 — Launch EC2 Instance

* Ubuntu Server 22.04 LTS
* Instance Type: t2.micro
* Allow SSH (22)
* Allow HTTP (80)
* Allow Custom TCP (8080)

---

# 🚀 Step 2 — Connect to EC2

```bash
ssh -i my-key.pem ubuntu@<EC2_PUBLIC_IP>
```

---

# 🚀 Step 3 — Install Java 21

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y openjdk-21-jdk

java -version
```

---

# 🚀 Step 4 — Install Jenkins

```bash
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key | \
sudo tee /etc/apt/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install -y jenkins
```

---

# 🚀 Step 5 — Start Jenkins

```bash
sudo systemctl enable jenkins

sudo systemctl start jenkins

sudo systemctl status jenkins
```

---

# 🚀 Step 6 — Retrieve Jenkins Password

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

# 🚀 Step 7 — Access Jenkins

Open:

```
http://EC2_PUBLIC_IP:8080
```

Paste the administrator password.

---

# 🚀 Step 8 — Initial Jenkins Setup

* Install Suggested Plugins
* Create Admin User
* Configure Jenkins URL
* Start Using Jenkins

---

# 🌐 Configure Nginx Reverse Proxy

Install Nginx

```bash
sudo apt install nginx -y

sudo systemctl enable nginx

sudo systemctl start nginx
```

Create configuration

```bash
sudo nano /etc/nginx/sites-available/jenkins
```

```nginx
server {
    listen 80;

    server_name your-domain.com;

    location / {

        proxy_pass http://localhost:8080;

        proxy_set_header Host $host;

        proxy_set_header X-Real-IP $remote_addr;

        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        proxy_set_header X-Forwarded-Proto $scheme;

    }
}
```

Enable configuration

```bash
sudo ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/

sudo nginx -t

sudo systemctl reload nginx
```

---

# ✅ Verification

Check Jenkins status

```bash
sudo systemctl status jenkins
```

Expected Output

```
Active: active (running)
```

Open

```
http://EC2_PUBLIC_IP:8080
```

Jenkins Dashboard should appear successfully.

---

# 🎯 Skills Gained

* AWS EC2
* Ubuntu Linux
* Jenkins
* Java 21
* Nginx
* Linux Services
* CI/CD
* Reverse Proxy
* Security Groups
* SSH

---

# 🚀 Future Improvements

* Jenkins Pipelines
* GitHub Webhooks
* Docker Integration
* Docker Hub
* Kubernetes
* Terraform
* SonarQube
* Trivy Security Scans
* AWS EKS
* GitOps

---

# 🙏 Acknowledgements

Special thanks to **Mise Academy** and **Hafiz Muhammad Umair Munir** for their excellent guidance and hands-on DevOps training.

---

## ⭐ If you found this project helpful

Give this repository a ⭐ and feel free to fork it to support the project.

Happy Learning! 🚀
