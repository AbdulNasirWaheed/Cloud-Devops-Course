📅 Date: Day 35 of #100DaysOfCode
🏷️ Tags: #BashScripting #DevOps #Linux #Automation #SysAdmin

text

---

### 📄 FILE 3: `README_DAY36_DEVOPS_SCRIPTS.md`
*(Real-World Bash Scripting – 4 Industry Scenarios)*

```markdown
# 🛠️ Day 36: Real-World Bash Scripting for DevOps Tasks

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![DevOps](https://img.shields.io/badge/Practice-DevOps-0060FF?style=for-the-badge&logo=devops&logoColor=white)

## 📘 Project Overview

Today I stepped into the shoes of a **Junior DevOps Engineer** at a mid-sized tech company. My senior gave me 4 real-world automation challenges to solve using Bash scripts.

From checking website uptime to backing up critical configs—these scripts are ready for production use.

---

## 🎯 Objective

- Write, execute, and apply Bash scripts in real-world industry scenarios
- Automate system monitoring, backup routines, connectivity checks, and path validation
- Build a strong foundation for daily DevOps responsibilities

---

## 🏢 Industry Scenario

**Role:** Junior DevOps Engineer  
**Tasks:** Monitor infrastructure health, create backup routines, check server resources, validate file systems, ensure service availability.

---

## 📂 Repository Structure
.
├── check_website.sh # 🌐 Website/API reachability checker
├── disk_alert.sh # 🗂️ Disk usage monitor with alerting
├── backup_etc.sh # 💾 Automated /etc directory backup
└── check_path_type.sh # 📁 File/directory path validator

text

---

## 📄 Scripts Documentation

---

### 1. 🌐 Website Reachability Checker (`check_website.sh`)

Quickly tests if a website, API, or IP is reachable.

```bash
#!/bin/bash
WEBSITE=${1:-google.com}

if ping -c 1 $WEBSITE &> /dev/null; then
  echo "SUCCESS: $WEBSITE is reachable"
else
  echo "FAILURE: $WEBSITE is not reachable"
fi
Command	Output
./check_website.sh github.com	SUCCESS: github.com is reachable
./check_website.sh	SUCCESS: google.com is reachable
2. 🗂️ Disk Usage Monitor (disk_alert.sh)
Alerts when disk usage on the root partition crosses 80%.

bash
#!/bin/bash
THRESHOLD=80
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "ALERT: Disk usage is above ${THRESHOLD}% - Currently at ${USAGE}%"
else
  echo "Disk usage is normal: ${USAGE}%"
fi
Command	Output (if at 75%)	Output (if at 85%)
./disk_alert.sh	Disk usage is normal: 75%	ALERT: Disk usage is above 80% - Currently at 85%
3. 💾 Automated Backup of /etc (backup_etc.sh)
Creates a timestamped tarball of the /etc directory.

bash
#!/bin/bash
BACKUP_DIR="/backup"
FILENAME="etc-backup-$(date +%F).tar.gz"

mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/$FILENAME /etc

echo "Backup completed: $BACKUP_DIR/$FILENAME"
⚠️ Important: Requires sudo to read /etc.

Command	Output
sudo ./backup_etc.sh	Backup completed: /backup/etc-backup-2026-06-27.tar.gz
💡 Pro Tip: Schedule with cron:

bash
0 2 * * * sudo /path/to/backup_etc.sh
4. 📁 Path Type Validator (check_path_type.sh)
Determines if a given path is a file, directory, or neither.

bash
#!/bin/bash
path=$1

if [ -f "$path" ]; then
  echo "$path is a file."
elif [ -d "$path" ]; then
  echo "$path is a directory."
else
  echo "$path is not a file or directory."
fi
Command	Output
./check_path_type.sh /etc	/etc is a directory.
./check_path_type.sh ~/.bashrc	/home/user/.bashrc is a file.
./check_path_type.sh /invalid	/invalid is not a file or directory.
🚀 Getting Started
Clone the repo:

bash
git clone https://github.com/yourusername/devops-bash-scripts.git
cd devops-bash-scripts
Make scripts executable:

bash
chmod +x *.sh
Run any script:

bash
./check_website.sh google.com
./disk_alert.sh
sudo ./backup_etc.sh
./check_path_type.sh /etc
🧠 Skills Mastered
Concept	Script
Conditional Logic (if-elif-else)	All scripts
Command Substitution ($())	disk_alert.sh
User Input ($1, ${1:-default})	check_website.sh, check_path_type.sh
System Tools (ping, df, tar, mkdir)	Scripts 1, 2, 3
Text Processing (awk, sed)	disk_alert.sh
Timestamp Generation (date +%F)	backup_etc.sh
File/Dir Testing (-f, -d)	check_path_type.sh
🙏 Acknowledgments
A massive shoutout to:

miseacademy – For industry-aligned DevOps training.

Hafiz Muhammad Umair Munir – For expert mentorship and real-world guidance.

🔗 Connect with Me
GitHub: Your GitHub Profile

LinkedIn: Your LinkedIn Profile

⭐ If this repository helped you, don't forget to star it! ⭐
git config --global user.email "abdulnasirwaheed@gmail.com"