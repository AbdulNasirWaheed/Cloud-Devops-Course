# Day-52: Commands Reference

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Topic
Jenkins CI/CD Pipeline Setup on AWS EC2 — Installing and configuring Jenkins LTS with Nginx reverse proxy.

## 🔧 Commands

### Step 1: Connect to EC2
```bash
ssh -i my-key.pem ubuntu@<EC2_PUBLIC_IP>
```

### Step 2: Update & Install Java 21
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y openjdk-21-jdk
java -version
```

### Step 3: Install Jenkins
```bash
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key | \
sudo tee /etc/apt/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install -y jenkins
```

### Step 4: Start Jenkins
```bash
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
```

### Step 5: Retrieve Jenkins Password
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### Step 6: Access Jenkins
```
http://EC2_PUBLIC_IP:8080
```

### Step 7: Configure Nginx Reverse Proxy
```bash
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx

sudo nano /etc/nginx/sites-available/jenkins
```

Nginx configuration:
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

Enable Nginx configuration:
```bash
sudo ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

### Step 8: Verify Jenkins
```bash
sudo systemctl status jenkins
```

Expected output:
```
Active: active (running)
```

Access:
```
http://EC2_PUBLIC_IP:8080
```

### Initial Jenkins Setup Steps
- Install Suggested Plugins
- Create Admin User
- Configure Jenkins URL
- Start Using Jenkins
