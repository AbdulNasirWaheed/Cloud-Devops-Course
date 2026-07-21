# Day-51: Commands Reference

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Topic
Three-Tier App on AWS ECS (Fargate) — Deploying a full-stack MERN application to Amazon ECS (Fargate) using Amazon ECR.

## 🔧 Commands

### Install AWS CLI
```bash
sudo apt update
sudo apt install unzip curl -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

### Configure AWS Credentials
```bash
aws configure
```

### Clone the Application
```bash
git clone https://github.com/Umair1012/three-tier-app.git
cd three-tier-app
```

### Build Docker Images
```bash
# Backend
docker build -t three-tier-backend -f backend/Dockerfile .

# Frontend
docker build -t three-tier-frontend -f frontend/Dockerfile .
```

### Push Images to Amazon ECR
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

### ECS Task Definition Environment Variables
| Container | Environment Variable | Value |
|-----------|----------------------|-------|
| Backend | `MONGO_URL` | `mongodb://mongodb:27017/notes` |
| Frontend | `REACT_APP_API_URL` | `http://backend:5000` |

### Cleanup
```bash
sudo docker system prune -af
sudo docker volume prune -f
docker system df
```
