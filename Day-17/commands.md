# Day-17: Commands Reference

Linux system basics, user context, and EC2 instance familiarization.

## Session Scope
- System information commands
- User and permission context on EC2
- Basic diagnostics and environment inspection
- Preparing the server for production workloads

## ℹ️ System Information

```bash
# Current user
whoami

# User and group IDs
id

# Hostname
hostname
hostname -I

# Kernel and OS info
uname -a
uname -r

# System uptime and load
uptime

# Current date/time
date
```

## 👤 User Context

```bash
# Switch user
sudo su - ubuntu

# Check current user info
whoami
id ubuntu
```

## 🧹 Basic Maintenance

```bash
# Update package lists
sudo apt update

# Clean up
sudo apt autoremove
```
