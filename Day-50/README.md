# 🐳 Secure Deployment of a Full-Stack MERN App Using Docker on AWS

Containerized deployment of a **React + Node.js + MongoDB (MERN)** application using **Docker multi-stage builds**, **Docker Compose**, and security best practices — deployed on an **AWS EC2** instance.

> 📚 Based on a walkthrough by **Hafiz Muhammad Umair Munir**, via **MiseAcademy**.

---

## 📖 Industry Scenario

A travel-tech startup wants to containerize and securely deploy their web application (React frontend, Node.js backend, MongoDB database) on an AWS EC2 instance — following Docker best practices for image size, security, and observability.

## 🎯 Objectives

- Clone and containerize the app (React + Node.js + MongoDB)
- Use Alpine images and Docker multi-stage builds
- Apply Docker security best practices (non-root user, minimal images, healthchecks)
- Deploy and expose the app securely on AWS EC2 via Docker Compose

---

## 🗂️ Project Structure

```
three-tier-app/
├── backend/
│   ├── Dockerfile
│   └── .env
├── frontend/
│   ├── Dockerfile
│   └── .env
└── docker-compose.yml
```

---

## 🛠️ Tech Stack

| Layer      | Technology |
|------------|------------|
| Frontend   | React (served via `serve`) |
| Backend    | Node.js |
| Database   | MongoDB 6.0 |
| Container  | Docker (multi-stage, Alpine) |
| Orchestration | Docker Compose 3.8 |
| Hosting    | AWS EC2 (Ubuntu) |

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Umair1012/three-tier-app.git
cd three-tier-app
```

### 2. Backend Dockerfile (multi-stage, Alpine)

```dockerfile
# Stage 1: Build
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

# Stage 2: Production
FROM node:18-alpine
RUN adduser -S appuser
WORKDIR /app
COPY --from=builder /app .
USER appuser
EXPOSE 5000
CMD ["node", "server.js"]
```

### 3. Frontend Dockerfile (multi-stage, Alpine)

```dockerfile
# Stage 1: Build React app
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Serve with 'serve'
FROM node:18-alpine
RUN npm install -g serve
COPY --from=builder /app/build /build
RUN adduser -S appuser
USER appuser
EXPOSE 3000
CMD ["serve", "-s", "/build"]
```

### 4. Docker Compose

MongoDB is pulled directly as an image — no separate Dockerfile needed. See [`docker-compose.yml`](./docker-compose.yml) for the full service definitions (backend, frontend, mongo), including:

- Non-root `user` directives
- `read_only` filesystems
- Healthchecks per service
- A dedicated bridge network (`app-network`)
- Persistent MongoDB volume

---

## ☁️ Deploying on AWS EC2

### Launch & prepare the instance

- Ubuntu EC2 instance (`t2.medium` or higher recommended)
- Security group inbound rules: `22`, `8000`, `5000`, `27017`

```bash
# Connect to EC2
ssh -i your-key.pem ubuntu@your-ec2-ip

# Install Docker & Docker Compose
sudo apt update && sudo apt install -y docker.io docker-compose
sudo usermod -aG docker ubuntu
newgrp docker

# Clone the repo
git clone https://github.com/Umair1012/three-tier-app.git
cd three-tier-app
```

### Build and run

```bash
docker-compose up --build -d
```

### Reset / rebuild if needed

```bash
sudo docker-compose down --volumes --remove-orphans
sudo docker-compose build
sudo docker-compose up -d
```

### Debugging

```bash
docker-compose logs frontend
docker-compose logs backend
```

---

## ✅ Verifying the Deployment

| Service    | URL |
|------------|-----|
| Frontend   | `http://<EC2-IP>:8000` |
| Backend API | `http://<EC2-IP>:5000` |
| MongoDB    | Internal only — `mongo:27017` |

---

## 🔐 Docker Security Best Practices Applied

- ✅ Multi-stage builds
- ✅ Alpine-based minimal images
- ✅ Non-root users
- ✅ Healthcheck endpoints
- ✅ Port-specific security group rules
- ✅ Docker Compose version 3.8

> 🛑 **Production note:** Restrict MongoDB (`27017`) access to the backend container only — do not expose it publicly.

---

## 🎯 Conclusion

This project demonstrates an end-to-end, production-style Dockerization and deployment of a full-stack MERN application using Docker best practices on AWS. Multi-stage builds and Alpine images minimize the attack surface, while healthchecks and non-root users improve both security and observability — reflecting how modern DevOps teams deploy microservices in the real world.

---

## 🙏 Credits

- **Hafiz Muhammad Umair Munir**
- **MiseAcademy**
