# Lecture 30 — Searching for Files Using `find` & `locate` + Command Combinations

## Industry Scenario
You are a DevOps Engineer at a software company. Your tasks:
- Find all `.txt` configuration files in a deployment directory for review
- Locate an archived log file `backup.gz.tar` to verify an issue reported by QA
- Audit IAM users, EC2 instances, and SSH logs using combined Linux commands

---

## 📁 Setup: Create Dummy Files & Directories

```bash
# Project config directory
sudo mkdir -p /opt/devops-app/configs/database
sudo touch /opt/devops-app/configs/app1.txt
sudo touch /opt/devops-app/configs/readme.md
sudo touch /opt/devops-app/configs/database/db_config.txt

# Backup log directory
sudo mkdir -p /var/log/devops-backup
sudo touch /var/log/devops-backup/backup.gz.tar

# users.csv
cat > ~/users.csv <<EOF
username,email,role
john,john@example.com,admin
alice,alice@example.com,developer
bob,bob@example.com,analyst
EOF

# ec2_instances.csv
cat > ~/ec2_instances.csv <<EOF
i-0a1b2c3d4e5f6g7h,WebServer,t2.micro,us-east-1a,34.205.10.1,running
i-1a2b3c4d5e6f7g8h,DBServer,t2.medium,us-west-2b,52.13.45.10,stopped
i-9z8y7x6w5v4u3t2s,AppServer,t3.small,eu-central-1a,18.184.22.99,running
EOF

# auth.log
cat > ~/auth.log <<EOF
May 27 10:23:44 server sshd[12345]: Accepted password for admin from 192.168.1.5 port 45520
May 27 10:25:10 server sshd[12347]: Failed password for root from 203.0.113.15 port 49821
May 27 10:26:11 server sshd[12349]: Failed password for user1 from 198.51.100.22 port 50731
EOF

# iam_users.csv
cat > ~/iam_users.csv <<EOF
username,created_date,password_enabled,mfa_active,console_access
dev_user,2024-01-15,true,true,true
admin_user,2023-12-01,true,false,true
read_only,2024-05-01,false,false,false
EOF
```

---

## 🔍 Part 1: `find` Command

### Basic Syntax
```bash
find [path] [options] [expression]
```

### Task: Find all `.txt` files in the configs directory
```bash
find /opt/devops-app/configs -name "*.txt"
```
**Expected output:**
```
/opt/devops-app/configs/app1.txt
/opt/devops-app/configs/database/db_config.txt
```

### Bonus: Filter files modified in the last 7 days
```bash
find /opt/devops-app/configs -name "*.txt" -mtime -7
```

### More `find` Examples
```bash
# Find by file type (f = file, d = directory)
find /opt/devops-app -type f -name "*.txt"
find /opt/devops-app -type d

# Find files larger than 1MB
find /var/log -size +1M

# Find and delete old log files
find /var/log -name "*.log" -mtime +30 -delete

# Find files owned by a specific user
find /home -user ubuntu
```

---

## 🔍 Part 2: `locate` Command

### Install & Setup
```bash
sudo apt update
sudo apt install plocate

# Update the file database (run after creating new files)
sudo updatedb
```

> `updatedb` indexes all file paths on the system into `/var/lib/plocate/plocate.db`.  
> Always run it after creating new files so `locate` can find them.

### Task: Find the backup archive system-wide
```bash
locate backup.gz.tar
```
**Expected output:**
```
/var/log/devops-backup/backup.gz.tar
```

### More `locate` Examples
```bash
# Case-insensitive search
locate -i backup.gz.tar

# Limit number of results
locate -n 5 sshd_config

# Count matches
locate -c "*.conf"
```

---

## 🔗 find vs locate — When to Use Which

| Feature          | `find`                          | `locate`                        |
|------------------|---------------------------------|---------------------------------|
| Search method    | Scans filesystem in real time   | Queries a pre-built database    |
| Speed            | Slower (live scan)              | Faster (indexed lookup)         |
| Accuracy         | Always current                  | Depends on last `updatedb` run  |
| Filter options   | Rich (size, time, owner, type)  | Basic (name pattern only)       |
| Best for         | Precise, filtered searches      | Quick system-wide file lookup   |

---

## ⚙️ Combined Command Examples

### `cut` + `awk` — Extract & Analyze EC2 Instance Data
```bash
# Count instances per availability zone
cut -d ',' -f 3,4 ec2_instances.csv | awk -F ',' '{count[$2]++} END {for (zone in count) print zone, count[zone]}'
```

### `cut` + `sed` — Clean & Format IAM User Report
```bash
# Extract username and console access, remove header row
cut -d ',' -f 1,5 iam_users.csv | sed '1d'
```

---

## 🔐 Real-Life Cloud Security Scenarios

### Get Users Without MFA from IAM Report
```bash
cut -d ',' -f 1,4 iam_users.csv | awk -F ',' '$2 == "false" {print $1}'
```

### Extract Failed SSH IPs and Clean Output
```bash
grep "Failed password" ~/auth.log | cut -d ' ' -f 11 | sed 's/[^0-9\.]//g'
```

### Extract EC2 IDs & Status, Format as ID=STATUS
```bash
cut -d ',' -f 1,6 ec2_instances.csv | sed 's/,/=/'
```

---

## 🔄 Bonus: `cut` + `awk` + `sed` Combined

```bash
# Goal: Show usernames of console users WITHOUT MFA
# Steps: cut relevant fields → remove header → filter by MFA=false + console=true
cut -d ',' -f 1,4,5 iam_users.csv | sed '1d' | awk -F ',' '$2 == "false" && $3 == "true" {print $1}'
```

**What each command does:**
- `cut -d ',' -f 1,4,5` — extracts username, mfa_active, console_access
- `sed '1d'` — removes the header row
- `awk '$2 == "false" && $3 == "true"'` — filters users without MFA but with console access

---

## 📊 Quick Reference Table

| Command                                        | Purpose                              |
|------------------------------------------------|--------------------------------------|
| `find /path -name "*.txt"`                     | Find .txt files recursively          |
| `find /path -mtime -7`                         | Files modified in last 7 days        |
| `find /path -size +1M`                         | Files larger than 1MB                |
| `find /path -type f -user ubuntu`              | Files owned by a user                |
| `sudo updatedb`                                | Refresh locate database              |
| `locate filename`                              | Fast system-wide file search         |
| `locate -i filename`                           | Case-insensitive locate              |
| `cut \| awk`                                   | Extract columns + analyze data       |
| `cut \| sed`                                   | Extract columns + clean/format       |
| `grep \| cut \| sed`                           | Filter + extract + clean in one pipe |
| `cut \| sed \| awk`                            | Full pipeline: extract, clean, filter|
