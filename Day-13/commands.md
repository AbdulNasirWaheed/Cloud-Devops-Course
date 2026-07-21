# Day-13: Commands Reference

AWS EC2 instance launch and first SSH connection from local machine.

## Session Scope
- Launching an Ubuntu EC2 instance via AWS Console
- Configuring Security Groups (SSH inbound rules)
- Downloading and securing the `.pem` key pair
- Connecting to EC2 via SSH from Windows (Git Bash / PowerShell)

## 🔗 SSH Connection

```bash
# Set correct permissions on the PEM key
chmod 400 ubuntu.pem

# Connect to EC2 instance
ssh -i "ubuntu.pem" ubuntu@ec2-16-171-142-147.eu-north-1.compute.amazonaws.com
```

## 📁 Basic Navigation on EC2

```bash
# Print working directory
pwd

# List directory contents
ls
ls -la

# Change directory
cd /home/ubuntu
cd ..

# Create directory
mkdir projects
mkdir -p projects/terraform/aws
```

```text
Output on successful SSH connection:
Welcome to Ubuntu 26.04 LTS (GNU/Linux 7.0.0-1004-aws x86_64)
System load:  0.08
IPv4 address for ens5: 172.31.37.122
ubuntu@ip-172-31-37-122:~$
```
