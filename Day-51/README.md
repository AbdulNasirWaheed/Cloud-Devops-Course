# 🚀 Three-Tier App Deployment on AWS ECS (Fargate)

Deploying a full-stack **Node.js + React + MongoDB** application on **Amazon ECS (Fargate)** using **Docker** and **Amazon ECR** — a real-world DevOps pipeline simulating a production microservice deployment.

---

## 🏢 Industry Scenario

As a DevOps Engineer at a SaaS startup, the goal is to take a full-stack application handed off by the dev team and deploy it to the cloud:

- 🧠 **Backend:** Node.js (API server)
- 🎨 **Frontend:** React (UI)
- 💾 **Database:** MongoDB (NoSQL)

---

## 🎯 Objective

| Component | Action |
|---|---|
| Frontend (React) | Dockerize → Push to ECR → Deploy to ECS |
| Backend (Node) | Dockerize → Push to ECR → Deploy to ECS |
| MongoDB | Use `mongo:latest` image directly from Docker Hub |
| ECS | Run all 3 containers in one Fargate Task (internal networking) |
| Security | Non-root users, secure images, IAM roles |

---

## 🧰 Prerequisites

- ✅ AWS Account with access to ECS, ECR, IAM, and VPC
- ✅ Docker installed & running
- ✅ AWS CLI installed & configured (`aws configure`)
- ✅ VPC with at least 1 public subnet
- ✅ IAM Role: `ecsTaskExecutionRole` with ECR & CloudWatch permissions

---

## 🗂️ Architecture

```
                ┌─────────────────────────┐
                │      ECS Fargate Task    │
                │                          │
   Internet ───▶│  🟢 Frontend (React)     │
                │     :3000 (public)       │
                │           │              │
                │           ▼              │
                │  🔵 Backend (Node.js)    │
                │     :5000 (internal)     │
                │           │              │
                │           ▼              │
                │  🟡 MongoDB              │
                │     :27017 (internal)    │
                └─────────────────────────┘
```

Containers communicate internally using **container names** (e.g. `mongodb://mongodb:27017/notes`).

---

## 🛠️ Setup & Deployment Steps

### 1️⃣ Install AWS CLI

```bash
sudo apt update
sudo apt install unzip curl -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

### 2️⃣ Configure AWS Credentials

Generate an **Access Key ID** and **Secret Access Key** from:
`AWS Console → IAM → Users → Security credentials → Create access key`

```bash
aws configure
```

### 3️⃣ Clone the Application

```bash
git clone https://github.com/Umair1012/three-tier-app.git
cd three-tier-app
```

### 4️⃣ Build Docker Images

```bash
# Backend
docker build -t three-tier-backend -f backend/Dockerfile .

# Frontend
docker build -t three-tier-frontend -f frontend/Dockerfile .
```

### 5️⃣ Push Images to Amazon ECR

```bash
# Create repositories
aws ecr create-repository --repository-name three-tier-backend
aws ecr create-repository --repository-name three-tier-frontend

# Authenticate Docker to ECR
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.us-east-1.amazonaws.com

# Tag & push backend
docker tag three-tier-backend:latest <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/three-tier-backend
docker push <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/three-tier-backend

# Tag & push frontend
docker tag three-tier-frontend:latest <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/three-tier-frontend
docker push <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/three-tier-frontend
```

### 6️⃣ Create ECS Cluster

- **AWS Console → ECS → Clusters → Create Cluster**
- Type: `Fargate (Networking Only)`
- Name: `three-tier-cluster`

### 7️⃣ Create Task Definition

- Launch type: `Fargate`
- Task Role: `ecsTaskExecutionRole`
- Network Mode: `awsvpc`
- Task Size: `1 vCPU`, `2–4 GB Memory`

**Containers:**

| Container | Image | Port | Notes |
|---|---|---|---|
| 🟡 `mongodb` | `mongo:latest` | 27017 | Essential |
| 🔵 `backend` | `<account-id>.dkr.ecr.us-east-1.amazonaws.com/three-tier-backend` | 5000 | Env: `MONGO_URL=mongodb://mongodb:27017/notes` |
| 🟢 `frontend` | `<account-id>.dkr.ecr.us-east-1.amazonaws.com/three-tier-frontend` | 3000 | Env: `REACT_APP_API_URL=http://backend:5000` |

### 8️⃣ Create ECS Service

- Cluster: `three-tier-cluster`
- Task Definition: as created above
- Launch type: `Fargate`
- Number of tasks: `1`
- Platform version: `LATEST`

**Networking:**

| Field | Value |
|---|---|
| VPC | Default/custom VPC |
| Subnets | Public subnet |
| Assign public IP | ✅ Enabled |
| Security Group | Open ports `3000`, `5000`, `27017` (for testing) |

> ⚠️ Restrict the MongoDB port (27017) to internal VPC traffic only in production.

### 9️⃣ Update Security Group — Inbound Rules

| Type | Port | Source |
|---|---|---|
| Custom TCP | 3000 | 0.0.0.0/0 |
| Custom TCP | 5000 | 0.0.0.0/0 |
| Custom TCP | 27017 | 0.0.0.0/0 *(optional)* |

### 🔟 Test the Application

1. Go to **ECS → Clusters → Services → Running Task**
2. Copy the **public IP**
3. Open it in your browser: `http://<public-ip>`

✅ React frontend loads
✅ React calls the Node backend internally (`http://backend:5000`)
✅ Node connects to MongoDB (`mongodb://mongodb:27017/notes`)

---

## 🧪 Sample Output

```
# ECS Public IP
http://3.90.123.45 → opens the app

# ECS Container Logs (CloudWatch)
Node started on port 5000
MongoDB connected
React app served on port 3000
```

---

## ✅ DevOps Best Practices Applied

| Best Practice | Applied | Description |
|---|:---:|---|
| Slim/base images | ✅ | Smaller & more secure |
| Non-root users | ✅ | Safer containers |
| No hardcoded secrets | ✅ | Uses environment variables |
| Private ECR repos | ✅ | Secure image storage |
| Internal networking | ✅ | Containers communicate by name |
| Minimal exposed ports | ✅ | Controlled via Security Groups |

---

## 🧹 Cleanup

```bash
sudo docker system prune -af
sudo docker volume prune -f
docker system df   # check disk usage
```

---

## 🏁 Conclusion

This project demonstrates a complete, real-world DevOps deployment pipeline:

- 🔒 Secure Docker images for Node.js + React
- 📤 Images pushed to Amazon ECR
- 🚀 Full three-tier architecture deployed on ECS Fargate
- 🌐 Publicly accessible app with internal container-to-container communication

---

## 🙏 Acknowledgements

Thanks to **Miseacademy** and **Hafiz Muhammad Umair Munir** for the guidance on this project.

---

## 🏷️ Tags

`#AWS` `#DevOps` `#Docker` `#ECS` `#Fargate` `#MongoDB` `#NodeJS` `#ReactJS` `#CloudComputing`
