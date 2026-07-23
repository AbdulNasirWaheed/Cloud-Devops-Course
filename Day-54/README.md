# 🚀 Django Notes App — Multi-Environment CI/CD Pipeline

A real-world CI/CD pipeline for deploying a Django Notes App to **two environments (Dev & Staging)** on a single EC2 instance using **Jenkins + Docker + GitHub** — no Docker Compose required.

> 🎓 Learned as part of a hands-on DevOps training with **MiseAcademy** and **Hafiz Muhammad Umair Munir**.

---

## 🏢 Scenario

As a DevOps engineer, you're managing a Django Notes App deployed to two environments (**Dev** and **Staging**) on a single EC2 instance using Docker containers. Source code lives in GitHub, Docker images are pushed to Docker Hub, and Jenkins automates the entire pipeline.

## 🎯 What This Pipeline Does

- ✅ Clones code from GitHub (`main` branch only)
- ✅ Builds and pushes a Docker image to Docker Hub
- ✅ Deploys two containers from the same image (Dev + Staging)
- ✅ Assigns separate host ports for each environment
- ✅ Secures Docker Hub credentials using Jenkins Secrets
- ✅ Triggers automatically via GitHub Webhook on every push to `main`

## 🧰 Tools Used

| Tool | Purpose |
|---|---|
| EC2 (Ubuntu) | Jenkins host & Docker runtime |
| GitHub | Source code hosting & webhook trigger |
| Jenkins | CI/CD pipeline orchestrator |
| Docker | Containerization |
| Docker Hub | Image registry |
| Jenkins Secrets | Secure credential management |

## 📦 Port Mapping

| Environment | Container Port | Host Port |
|---|---|---|
| Dev | 8000 | 8001 |
| Staging | 8000 | 8002 |

---

## 🛠 Setup Guide

### 1. Clone the repo

```bash
git clone https://github.com/Umair1012/django-notes-app.git
cd django-notes-app
```

### 2. Launch an EC2 instance

- OS: Ubuntu 22.04+
- Instance type: at least `t3.small` recommended (2GB RAM) — a `t2.micro`/`t3.micro` can run low on memory with Jenkins + Docker + two containers running simultaneously
- Open inbound ports: `22`, `8080`, `8001`, `8002`

```bash
ssh -i your-key.pem ubuntu@<EC2_PUBLIC_IP>
```

### 3. Install Java and Jenkins

```bash
sudo apt update
sudo apt install -y openjdk-21-jre

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list

sudo apt update
sudo apt install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

> Jenkins 2.5xx requires **Java 21**, not Java 17.

### 4. Install Docker

```bash
sudo apt install -y docker.io
sudo usermod -aG docker jenkins
sudo usermod -aG docker $USER
sudo systemctl restart jenkins
```

> Log out and back in (or reboot) for the group change to take effect.

### 5. Add swap (recommended on small instances)

```bash
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile swap swap defaults 0 0' | sudo tee -a /etc/fstab
```

### 6. Set up Jenkins

Open `http://<EC2_PUBLIC_IP>:8080` and unlock with:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Install recommended plugins, plus:
- Docker Pipeline
- GitHub Integration
- Credentials Binding

### 7. Add Docker Hub credentials

**Jenkins → Manage Jenkins → Credentials → Global → Add Credentials**

- Type: Username with password
- ID: `dockerhub`
- Username / Password: your Docker Hub login

### 8. Set up a GitHub webhook

**GitHub repo → Settings → Webhooks → Add Webhook**

- Payload URL: `http://<EC2_PUBLIC_IP>:8080/github-webhook/`
- Content type: `application/json`
- Events: Push

### 9. Create the Jenkins pipeline job

**Jenkins Dashboard → New Item → "django-ci-cd" → Pipeline**, then paste the Jenkinsfile below.

---

## 🧾 Jenkinsfile

```groovy
pipeline {
    agent any

    environment {
        IMAGE_NAME = 'misacademy/django-notes-app'
        DOCKER_CREDENTIALS_ID = 'dockerhub'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/Umair1012/django-notes-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    env.IMAGE_TAG = "${IMAGE_NAME}:${env.BUILD_NUMBER}"
                    sh "docker build -t ${env.IMAGE_TAG} ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKER_CREDENTIALS_ID}",
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                sh "docker push ${env.IMAGE_TAG}"
            }
        }

        stage('Deploy Dev and Staging') {
            steps {
                script {
                    def containers = ['dev': 8001, 'staging': 8002]
                    containers.each { envName, port ->
                        def containerName = "django-notes-${envName}"
                        sh """
                            docker rm -f ${containerName} || true
                            docker run -d --name ${containerName} --memory="300m" --restart unless-stopped \\
                            -p ${port}:8000 ${env.IMAGE_TAG}
                        """
                    }
                }
            }
        }

        stage('Clean up old images') {
            steps {
                sh 'docker image prune -f --filter "until=24h"'
            }
        }
    }

    post {
        success {
            echo "✅ Dev on 8001 | Staging on 8002"
        }
        failure {
            echo "❌ Deployment failed"
        }
        always {
            sh 'docker logout || true'
        }
    }
}
```

---

## 🚀 Trigger a Deployment

```bash
git checkout main
echo "### Trigger Jenkins deployment" >> README.md
git commit -am "Trigger Jenkins"
git push origin main
```

## ✅ Verify

```bash
docker ps
```

Expected output:

```
CONTAINER ID   IMAGE               PORTS                    NAMES
xxx            your-image:123      0.0.0.0:8001->8000/tcp   django-notes-dev
yyy            your-image:123      0.0.0.0:8002->8000/tcp   django-notes-staging
```

Access in browser:
- Dev: `http://<EC2_PUBLIC_IP>:8001`
- Staging: `http://<EC2_PUBLIC_IP>:8002`

---

## 📝 Notes & Lessons Learned

- Jenkins 2.5xx requires **Java 21** — Java 17 will fail to start the service.
- The Jenkins repo signing key must be fetched by key ID (not guessed URLs) if `NO_PUBKEY` errors persist:
  ```bash
  gpg --no-default-keyring --keyring /tmp/jenkins-temp-keyring.gpg \
      --keyserver hkps://keyserver.ubuntu.com --recv-keys <KEY_ID>
  ```
- Running two full app containers on a `t2.micro`/`t3.micro` (1GB RAM) can exhaust memory — add swap and/or a `--memory` limit per container, or size up to `t3.small`.
- `docker system prune -a -f` removes **everything**, including running-adjacent images and stopped containers — prefer `docker image prune -f` (or with `--filter "until=24h"`) for routine cleanup.

---

## 🙏 Acknowledgements

This project and pipeline were built as part of a hands-on DevOps learning journey with **MiseAcademy** and **Hafiz Muhammad Umair Munir**. 🎓
