📅 Date: Day 34 of #100DaysOfCode
🏷️ Tags: #AWS #S3 #CloudComputing #DevOps #WebDevelopment

text

---

### 📄 FILE 2: `README_DAY35_BASH_AUTOMATION.md`
*(Bash Scripting – User Management, Backups & System Monitoring)*

```markdown
# 🐧 Day 35: Bash Scripting – User Management & Backup Automation

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Platform-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

## 📘 Project Overview

Today I dived into **Real-Time Bash Scripting Scenarios** to automate critical DevOps tasks. Instead of manually adding users or checking disk space, I wrote reusable scripts that handle these repetitive jobs instantly.

This is what real SysAdmins and DevOps Engineers do daily—automate first, ask questions later! 🤖

---

## 🎯 Learning Objectives

- ✅ Understand loops (`for`, `while`), conditional statements (`if-else`), and functions in Bash
- ✅ Automate user account creation for onboarding new developers
- ✅ Set up daily backup automation for critical project files
- ✅ Add new system users with a default password in one command
- ✅ Check disk usage and service status automatically

---

## 🛠️ Scripts Implemented

### 1. 👤 User Onboarding Script (`add_dev_user.sh`)
Creates a new user with a default password and forces a password change on first login.

```bash
#!/bin/bash
USERNAME=$1
PASSWORD="Default@123"

sudo useradd -m -s /bin/bash $USERNAME
echo "$USERNAME:$PASSWORD" | sudo chpasswd
sudo chage -d 0 $USERNAME  # Force password change on login

echo "✅ User $USERNAME created successfully with default password."
2. 💾 Daily Backup Script (daily_backup.sh)
Archives a project directory with a timestamp and stores it in a secure backup location.

bash
#!/bin/bash
SOURCE_DIR="/var/www/html/project"
BACKUP_DIR="/backup/projects"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
FILENAME="project-backup-$TIMESTAMP.tar.gz"

mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/$FILENAME $SOURCE_DIR

echo "✅ Backup completed: $BACKUP_DIR/$FILENAME"
3. 🩺 System Health Check (health_check.sh)
Checks disk usage and monitors critical service statuses (e.g., Nginx, SSH).

bash
#!/bin/bash
# Disk Usage Check
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ $USAGE -gt 80 ]; then
  echo "⚠️ ALERT: Disk usage is at ${USAGE}%"
else
  echo "✅ Disk usage is normal: ${USAGE}%"
fi

# Service Status Check
SERVICE="nginx"
if systemctl is-active --quiet $SERVICE; then
  echo "✅ $SERVICE is running"
else
  echo "❌ $SERVICE is NOT running"
fi
🧠 Concepts Mastered
Concept	Application
Loops	Iterating through multiple users/services
Conditionals	Decision-making in health checks (if-else)
Functions	Reusable logic blocks for cleaner scripts
Variables	Storing dynamic values (usernames, paths, thresholds)
Cron Jobs	Scheduling automated backups (crontab -e)
📅 Scheduling with Cron
To automate the daily backup at 2 AM:

bash
0 2 * * * /home/user/scripts/daily_backup.sh
💡 Key Takeaways
Automation eliminates human error—no more typos in useradd commands!

Default passwords should be temporary and reset on first login for security.

Monitoring disk usage and service status prevents downtime.

Functions make scripts modular and reusable.

