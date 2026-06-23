# Lecture 32 – Real-Time Bash Scripting Scenarios

## 🎯 Objective
Hands-on experience with **shell scripting** for cloud administrators to automate routine tasks in AWS EC2 Linux servers.

By completing this lecture, you will be able to:
- Automate user management and backup operations.
- Understand loops, conditional statements, and functions.

---

## 🏢 Industry Scenario
You are a Cloud Administrator at a mid-sized tech company.  
Tasks include:
- Onboarding new developers by automating user account creation.  
- Setting up daily backup automation for project files.  
- Checking disk usage and service status.  

---

## 🧑‍💼 Task 1: Automate User Creation
**Filename:** `users_creation.sh`

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
📌 Explanation:

read reads user input.

useradd -m adds the user with a home directory.

passwd sets the user password.

🗂️ Task 2: Automate Daily Backup
Filename: backup_script.sh

bash
#!/bin/bash
# Script to back up important cloud files
SOURCE_DIR="/home/ubuntu/important-data"
BACKUP_DIR="/home/ubuntu/backups"
mkdir -p $BACKUP_DIR
cp -r $SOURCE_DIR/* $BACKUP_DIR
echo "Backup completed successfully."
📌 Explanation:

mkdir -p creates backup directory if it doesn’t exist.

cp -r copies data recursively from source to destination.

🔹 Positional Arguments Example
Filename: create_user.sh

bash
#!/bin/bash
USERNAME=$1
PASSWORD=$2
sudo useradd $USERNAME
echo "$USERNAME:$PASSWORD" | sudo chpasswd
echo "User $USERNAME created successfully with a default password."
▶️ Run:

bash
./create_user.sh john P@ss123
🔹 Loops in Bash
For Loop – Backup Multiple Files

bash
#!/bin/bash
FILES="file1.txt file2.txt file3.txt"
BACKUP_DIR="backup"
mkdir -p $BACKUP_DIR
for FILE in $FILES
do
  cp $FILE $BACKUP_DIR
  echo "$FILE backed up to $BACKUP_DIR"
done
🏁 Conclusion
Shell scripting empowers Cloud Administrators to:

Automate repetitive tasks.

Improve system efficiency and reliability.

Reduce human errors and save time.

Scale operations across cloud environments (AWS, Azure, GCP).

Keep practicing and gradually build more complex scripts involving monitoring, log rotation, deployment, and system hardening.