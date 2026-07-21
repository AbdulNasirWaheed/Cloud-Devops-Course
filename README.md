# 🌐 Cloud & DevOps Engineering Pathway

Welcome to the **Cloud & DevOps Course** repository! This repository acts as a comprehensive, structured, day-by-day learning journal and command reference guide for mastering **Linux Systems Administration**, **Amazon Web Services (AWS)**, **Docker & Containers**, **CI/CD Pipelines**, and **Bash Scripting Automation**.

The materials, labs, and scripts included here represent hands-on cloud administrator and DevOps engineer roles in simulated production environments.

---

## 🚀 Key Course Highlights
* **Linux Essentials:** File permissions (`chmod`), soft/hard linking, diagnostics (`vmstat`, `htop`, `df`, `free`), service management (`systemctl`).
* **Storage Management:** Provisioning, partitioning (`fdisk`), formatting (`ext4`), and persisting (`/etc/fstab`) AWS EBS volumes on EC2.
* **Networking & Security:** Troubleshooting connectivity, analyzing open ports (`ss`, `netstat`), and configuring UFW firewalls.
* **Log Auditing & Text Processing:** Filtering security incidents and parsing production logs using `grep`, `sed`, `awk`, and `cut`.
* **Automation:** Practical shell scripting (`bash`) to automate user onboarding and system backups.
* **Containerization:** Docker multi-stage builds, Docker Compose, and deploying containerized applications on AWS EC2.
* **Cloud Orchestration:** AWS ECS (Fargate), ECR, and running production workloads with internal container networking.
* **CI/CD Pipelines:** Jenkins installation, configuration, reverse proxy setup, and continuous integration workflows.
* **Infrastructure as Code:** IaC principles, CloudFormation and Terraform fundamentals, and immutable infrastructure patterns.

---

## 📅 Daily Learning Roadmap

Click on any day below to navigate to the specific lesson directory containing screenshots, commands, and labs:

| Week / Section | Day | Topic & Objective | Core Commands & Files |
| :--- | :--- | :--- | :--- |
| **Section 1: Version Control** | [Day 11](./Day-11/) | **Git & GitHub Basics**<br>Setting up repositories and versioning. | `git clone`, `commit`, `push`, `branch` |
| **Section 2: Cloud Foundations** | [Day 12](./Day-12/) | **AWS Account Provisioning**<br>Setting up AWS billing alerts, root MFA. | Console Setup, IAM Console |
| | [Days 13-17](./Day-13/) | **AWS EC2 Launch & SSH Connections**<br>Provisioning Ubuntu instances & SSH setup. | `ssh -i`, `pwd`, `ls`, `cd`, `mkdir` |
| **Section 3: Linux Admin** | [Day 18](./Day-18/) | **Access Control & AWS IAM**<br>Configuring Linux permissions & IAM roles. | `chmod`, IAM Group policies |
| | [Day 19](./Day-19/) | **Data Compression & Restores**<br>Compressing single files & directory archives. | `gzip`, `bzip2`, `zip`, `unzip` |
| | [Day 20](./Day-20/) | **Archiving Operations**<br>Creating and verifying compressed tar archives. | `tar -cvf`, `tar -xzvf` (`.tar.gz`, `.tar.bz2`) |
| | [Day 21](./Day-21/) | **Soft Links vs. Hard Links**<br>Managing filesystem inodes & configurations. | `ln -s`, `ln`, `ls -i` |
| | [Day 22](./Day-22/) | **Diagnostics & Process Monitoring**<br>CPU/Memory stress testing & service control. | `df`, `free`, `vmstat`, `htop`, `kill`, `systemctl` |
| | [Day 23](./Day-23/) | **AWS EBS Volume Configuration**<br>Attaching, formatting, and persisting mounts. | `fdisk`, `mkfs.ext4`, `/etc/fstab`, `blkid` |
| **Section 4: Cloud Storage & Net** | [Day 24](./Day-24/) | **Networking & Firewall Setup**<br>Troubleshooting and configuring server firewalls. | `ip a`, `ss -tulpn`, `traceroute`, `ufw` |
| | [Day 25](./Day-25/) | **Log Management in Production**<br>Configuring log rotation and custom log rules. | `/etc/logrotate.d/`, `tar`, `grep` |
| **Section 5: Log Parsing** | [Day 26](./Day-26/) | **Log Analysis with AWK**<br>Advanced field scanning and syntax formatting. | `awk '{print $1}'`, `BEGIN`/`END` blocks |
| | [Day 27](./Day-27/) | **Text Editing with sed**<br>In-place editing and credentials masking. | `sed -i`, regex substitution |
| | [Day 28](./Day-28/) | **Pattern Searching with grep**<br>Auditing security logs & SSH configuration. | `grep -r`, `grep -i -n`, `egrep` |
| | [Day 29](./Day-29/) | **Column Extraction with cut**<br>Parsing CSV reports and extracting IP inventory. | `cut -d',' -f1`, combining with `grep` |
| | [Day 30](./Day-30/) | **System File Finding & pipelines**<br>Finding files & complex auditing pipelines. | `find`, `locate`, `cut` + `awk` + `sed` |
| | [Day 31](./Day-31/) | **Bash Scripting Basics**<br>Variables, shebangs, and input processing. | `read`, shell variables, environment |
| | [Day 32](./Day-32/) | **Advanced Automation Scenarios**<br>Automating onboarding & backups using loops. | `for`, `if [ cond ]`, positional arguments |
| **Section 6: Containers & CI/CD** | [Day 36](./Day-36/) | **Cloud Administration Exercises**<br>Hands-on practice with Linux and AWS fundamentals. | Various Linux & AWS commands |
| | [Day 37](./Day-37/) | **Cloud Administration Exercises**<br>Extended practice sessions and skill reinforcement. | Various Linux & AWS commands |
| | [Day 38](./Day-38/) | **DevOps Tools & Cloud Services**<br>Configuring and integrating DevOps tooling. | Cloud CLI, service configuration |
| | [Day 39](./Day-39/) | **Cloud Services Configuration**<br>Configuring advanced cloud services. | AWS service CLI, configuration |
| | [Day 40](./Day-40/) | **Advanced Cloud Services**<br>Deep dive into cloud service orchestration. | Service orchestration commands |
| | [Day 41](./Day-41/) | **Advanced Cloud Administration**<br>Complex cloud administration scenarios. | Advanced AWS & Linux operations |
| | [Day 42](./Day-42/) | **Cloud Security & Compliance**<br>Implementing security controls and compliance monitoring. | IAM, security groups, auditing |
| | [Day 43](./Day-43/) | **Infrastructure Automation & Scripting**<br>Automating cloud tasks with scripting. | Shell scripting, automation patterns |
| | [Day 44](./Day-44/) | **Cloud Monitoring & Observability**<br>Setting up monitoring and logging infrastructure. | CloudWatch, monitoring tools |
| | [Day 45](./Day-45/) | **CI/CD Pipeline Fundamentals**<br>Building continuous integration and deployment workflows. | Pipeline configuration, automation |
| | [Day 46](./Day-46/) | **Container Orchestration Fundamentals**<br>Managing containerized workloads at scale. | Docker, container networking |
| | [Day 47](./Day-47/) | **Cloud IAM Deep Dive**<br>Advanced identity and access management. | IAM roles, policies, MFA |
| | [Day 48](./Day-48/) | **Infrastructure as Code (IaC)**<br>IaC principles, Terraform, and CloudFormation fundamentals. | IaC tools, declarative configs |
| | [Day 49](./Day-49/) | **Cloud Architecture & Design Patterns**<br>Designing scalable and resilient cloud architectures. | Architecture patterns, best practices |
| | [Day 50](./Day-50/) | **Docker MERN App on AWS EC2**<br>Containerizing and deploying a React + Node.js + MongoDB app using Docker multi-stage builds and Docker Compose on an EC2 instance. | `docker build`, `docker-compose up`, AWS EC2 |
| | [Day 51](./Day-51/) | **Three-Tier App on AWS ECS (Fargate)**<br>Deploying a full-stack MERN application to Amazon ECS (Fargate) using Amazon ECR for image storage and internal container networking. | AWS CLI, ECR, ECS, Docker Compose |
| | [Day 52](./Day-52/) | **Jenkins CI/CD Pipeline Setup**<br>Installing and configuring Jenkins LTS on AWS EC2 with Nginx reverse proxy for secure CI/CD automation. | `jenkins`, `openjdk-21-jdk`, Nginx, `systemctl` |

---

## 🛠️ Deep Dive: Featured Labs & Scenarios

### 💾 1. AWS EBS Volume Partitioning & Mount Persistence ([Day 23](./Day-23/))
**Scenario:** A DevOps Engineer needs to mount a new EBS volume at `/mnt/data` to store database files. The partition must survive EC2 instance reboots.
1. **Identify and partition the volume:**
    ```bash
    lsblk
    sudo fdisk /dev/xvdf   # Create partition
    ```
2. **Format and Mount:**
    ```bash
    sudo mkfs.ext4 /dev/xvdf1
    sudo mkdir -p /mnt/data
    sudo mount /dev/xvdf1 /mnt/data
    ```
3. **Persist the setup:**
    Extract the partition's UUID using `sudo blkid` and add it to `/etc/fstab` so it is re-mounted automatically upon boot:
    ```text
    UUID=xxxx-xxxx-xxxx-xxxx   /mnt/data   ext4   defaults,nofail   0   2
    ```

---

### 🛡️ 2. Security Incident Response & SSH Log Auditing ([Day 25](./Day-25/) & [Day 30](./Day-30/))
**Scenario:** Audit security logs (`auth.log`) to list unique IP addresses that attempted brute-force SSH attacks, and identify usernames logged in without MFA configured.
* **Filter failed logins & clean output:**
  ```bash
  grep "Failed password" /var/log/auth.log | cut -d' ' -f11 | sort | uniq -c
  ```
* **Audit console users lacking Multi-Factor Authentication (MFA):**
  ```bash
  # Parses a CSV export, filters out header and grabs accounts where console access = true and MFA = false
  cut -d',' -f1,4,5 iam_report.csv | sed '1d' | awk -F',' '$2=="true" && $3=="false" {print $1}'
  ```

---

### ⚙️ 3. Log Rotation Config (`/etc/logrotate.d/app`) ([Day 25](./Day-25/))
**Scenario:** Prevent production logs from filling up server disks by setting up automatic rotation (weekly, keep last 4 copies, compress old ones):
```text
/var/log/app/*.log {
    weekly
    rotate 4
    compress
    delaycompress
    missingok
    notifempty
    create 0660 app_user devops_group
}
```

---

### 🤖 4. Scripted User Creation & Backup Automation ([Day 32](./Day-32/))

#### Onboarding Script (`users_creation.sh`)
Automates the creation of a Linux user account with a secure default home directory and custom password prompt.
```bash
#!/bin/bash
echo "Enter username:"
read username
sudo useradd -m $username
echo "Enter password for $username:"
sudo passwd $username
```

#### Directory Backup Script (`backup_script.sh`)
```bash
#!/bin/bash
SOURCE_DIR="/home/ubuntu/important-data"
BACKUP_DIR="/home/ubuntu/backups"
mkdir -p $BACKUP_DIR
cp -r $SOURCE_DIR/* $BACKUP_DIR
echo "Backup completed successfully."
```

---

### 🐳 5. Secure Docker Deployment of MERN App on AWS EC2 ([Day 50](./Day-50/))
**Scenario:** Containerize a full-stack React + Node.js + MongoDB application and deploy it securely on an AWS EC2 instance using Docker multi-stage builds and Docker Compose.
- **Multi-stage Dockerfiles** using Alpine Linux for minimal image sizes
- **Non-root users** inside containers for security hardening
- **Healthchecks** for container health monitoring
- **Docker Compose** for orchestrating frontend, backend, and MongoDB services
- **Security Groups** exposing only ports 8000, 5000, and 27017

Key commands:
```bash
# Build images
docker build -t three-tier-backend -f backend/Dockerfile .
docker-compose up --build -d

# Verify
curl http://<EC2-IP>:8000   # Frontend
curl http://<EC2-IP>:5000   # Backend API
```

---

### ☁️ 6. Three-Tier Architecture on AWS ECS (Fargate) ([Day 51](./Day-51/))
**Scenario:** Deploy a production-ready full-stack application on Amazon ECS with Fargate, registering container images in Amazon ECR and configuring internal container networking.
- **ECR** for private Docker image storage
- **ECS Fargate** for serverless container orchestration
- **Task Definitions** with `awsvpc` network mode
- **Internal networking** using container names (`mongodb://mongodb:27017/notes`)

Key commands:
```bash
# Create ECR repositories
aws ecr create-repository --repository-name three-tier-backend

# Authenticate Docker to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com

# Push images
docker push <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/three-tier-backend
```

---

### 🚀 7. Jenkins CI/CD Pipeline on AWS EC2 ([Day 52](./Day-52/))
**Scenario:** Deploy a Jenkins LTS server on an AWS EC2 Ubuntu instance, configure Nginx as a reverse proxy, and prepare the environment for real-world continuous integration and deployment pipelines.
- **Jenkins LTS** installed with suggested plugins
- **Java 21** runtime environment
- **Nginx** reverse proxy for secure external access
- **Security Groups** allowing ports 22, 80, and 8080

Key commands:
```bash
sudo apt update && sudo apt install -y openjdk-21-jdk jenkins nginx
sudo systemctl enable --now jenkins nginx
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

## 💻 How to Run the Scripts
To test any of the automation scripts found in the `Day-31` or `Day-32` directories:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/AbdulNasirWaheed/Cloud-Devops-Course.git
    cd Cloud-Devops-Course
    ```
2. **Change to the target directory:**
    ```bash
    cd Day-32
    ```
3. **Make the script executable:**
    ```bash
    chmod +x users_creation.sh
    ```
4. **Execute:**
    ```bash
    ./users_creation.sh
    ```

---

## 🐳 How to Run Containerized Projects
For the Docker and ECS projects (Day 50 & 51):

1. **Clone the application repository:**
    ```bash
    git clone https://github.com/Umair1012/three-tier-app.git
    cd three-tier-app
    ```
2. **Build and run with Docker Compose:**
    ```bash
    docker-compose up --build -d
    ```
3. **Access the application:**
    - Frontend: `http://<EC2-IP>:8000`
    - Backend API: `http://<EC2-IP>:5000`

---

## 📚 Repository Structure
```
Cloud-Devops-Course/
├── Day-11/                    # Git & GitHub Basics
├── Day-12/                    # AWS Account Provisioning
├── Day-13/ - Day-17/          # AWS EC2 Launch & SSH
├── Day-18/                    # Linux Permissions & IAM
├── Day-19/ - Day-22/          # Compression, Archiving, Links, Diagnostics
├── Day-23/                    # AWS EBS Volume Configuration
├── Day-24/                    # Networking & Firewall Setup
├── Day-25/                    # Log Management & Rotation
├── Day-26/ - Day-30/          # Log Parsing: AWK, sed, grep, cut, find
├── Day-31/ - Day-32/          # Bash Scripting & Automation
├── Day-36/ - Day-49/          # Advanced Cloud, Containers, Security, IaC
├── Day-50/                    # Docker MERN App on EC2
├── Day-51/                    # ECS Fargate Three-Tier Deployment
├── Day-52/                    # Jenkins CI/CD Pipeline Setup
└── README.md                  # This file
```

---

*Developed as part of the DevOps & Cloud Journey program.*
