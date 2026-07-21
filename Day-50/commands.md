# Day-50: Commands Reference

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Topic
Docker MERN App on AWS EC2 — Containerizing and deploying a React + Node.js + MongoDB app using Docker multi-stage builds and Docker Compose.

## 🔧 Commands

### Clone the Repository
```bash
git clone https://github.com/Umair1012/three-tier-app.git
cd three-tier-app
```

### Backend Dockerfile (multi-stage, Alpine)
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

### Frontend Dockerfile (multi-stage, Alpine)
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

### Docker Compose
```bash
# Build and start
docker-compose up --build -d

# Stop and remove
docker-compose down --volumes --remove-orphans

# Rebuild
docker-compose build

# View logs
docker-compose logs frontend
docker-compose logs backend
```

### AWS EC2 Setup
```bash
# Connect to EC2
ssh -i your-key.pem ubuntu@your-ec2-ip

# Install Docker & Docker Compose
sudo apt update && sudo apt install -y docker.io docker-compose
sudo usermod -aG docker ubuntu
newgrp docker
```

### Verification
```bash
# Test frontend
curl http://<EC2-IP>:8000

# Test backend API
curl http://<EC2-IP>:5000
```

### Cleanup
```bash
sudo docker system prune -af
sudo docker volume prune -f
docker system df
```
