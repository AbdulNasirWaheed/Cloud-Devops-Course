# Day-32: Commands Reference

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Topic
Advanced Automation Scenarios — Automating onboarding & backups using loops, conditionals, and positional arguments.

## 🔧 Commands

### Task 1: Automate User Creation
**File:** `users_creation.sh`
```bash
#!/bin/bash
# Script to create a new user

echo "Enter username:"
read username

# Create user with home directory
sudo useradd -m $username

# Set password
echo "Enter password for $username:"
sudo passwd $username
```

### Task 2: Automate Daily Backup
**File:** `backup_script.sh`
```bash
#!/bin/bash
# Script to back up important cloud files
SOURCE_DIR="/home/ubuntu/important-data"
BACKUP_DIR="/home/ubuntu/backups"
mkdir -p $BACKUP_DIR
cp -r $SOURCE_DIR/* $BACKUP_DIR
echo "Backup completed successfully."
```

### Positional Arguments Example
**File:** `create_user.sh`
```bash
#!/bin/bash
USERNAME=$1
PASSWORD=$2
sudo useradd $USERNAME
echo "$USERNAME:$PASSWORD" | sudo chpasswd
echo "User $USERNAME created successfully with a default password."
```

**Run:**
```bash
./create_user.sh john P@ss123
```

### Loops in Bash
**For Loop — Backup Multiple Files**
```bash
#!/bin/bash
FILES="file1.txt file2.txt file3.txt"
BACKUP_DIR="backup"
mkdir -p $BACKUP_DIR
for FILE in $FILES
do
  cp $FILE $BACKUP_DIR
  echo "$FILE backed up to $BACKUP_DIR"
done
```

### Disk Usage & Service Status Check
```bash
df -h
systemctl status <service-name>
```
