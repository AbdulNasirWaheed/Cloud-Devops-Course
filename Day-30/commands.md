# Day-30: Commands Reference

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Topic
System File Finding & Pipelines — Finding files & complex auditing pipelines using `find`, `locate`, and command combinations.

## 🔧 Commands

### Setup: Create Dummy Files & Directories
```bash
sudo mkdir -p /opt/devops-app/configs/database
sudo touch /opt/devops-app/configs/app1.txt
sudo touch /opt/devops-app/configs/readme.md
sudo touch /opt/devops-app/configs/database/db_config.txt

sudo mkdir -p /var/log/devops-backup
sudo touch /var/log/devops-backup/backup.gz.tar

cat > ~/users.csv <<EOF
username,email,role
john,john@example.com,admin
alice,alice@example.com,developer
bob,bob@example.com,analyst
EOF

cat > ~/ec2_instances.csv <<EOF
i-0a1b2c3d4e5f6g7h,WebServer,t2.micro,us-east-1a,34.205.10.1,running
i-1a2b3c4d5e6f7g8h,DBServer,t2.medium,us-west-2b,52.13.45.10,stopped
i-9z8y7x6w5v4u3t2s,AppServer,t3.small,eu-central-1a,18.184.22.99,running
EOF

cat > ~/auth.log <<EOF
May 27 10:23:44 server sshd[12345]: Accepted password for admin from 192.168.1.5 port 45520
May 27 10:25:10 server sshd[12347]: Failed password for root from 203.0.113.15 port 49821
May 27 10:26:11 server sshd[12349]: Failed password for user1 from 198.51.100.22 port 50731
EOF

cat > ~/iam_users.csv <<EOF
username,created_date,password_enabled,mfa_active,console_access
dev_user,2024-01-15,true,true,true
admin_user,2023-12-01,true,false,true
read_only,2024-05-01,false,false,false
EOF
```

### Part 1: `find` Command
```bash
# Basic syntax
find [path] [options] [expression]

# Find all .txt files in the configs directory
find /opt/devops-app/configs -name "*.txt"

# Filter files modified in the last 7 days
find /opt/devops-app/configs -name "*.txt" -mtime -7

# Find by file type
find /opt/devops-app -type f -name "*.txt"
find /opt/devops-app -type d

# Find files larger than 1MB
find /var/log -size +1M

# Find and delete old log files
find /var/log -name "*.log" -mtime +30 -delete

# Find files owned by a specific user
find /home -user ubuntu
```

### Part 2: `locate` Command
```bash
# Install & setup
sudo apt update
sudo apt install plocate
sudo updatedb

# Find the backup archive system-wide
locate backup.gz.tar

# Case-insensitive search
locate -i backup.gz.tar

# Limit number of results
locate -n 5 sshd_config

# Count matches
locate -c "*.conf"
```

### Combined Command Examples
```bash
# cut + awk — Count instances per availability zone
cut -d ',' -f 3,4 ec2_instances.csv | awk -F ',' '{count[$2]++} END {for (zone in count) print zone, count[zone]}'

# cut + sed — Extract username and console access, remove header row
cut -d ',' -f 1,5 iam_users.csv | sed '1d'
```

### Real-Life Cloud Security Scenarios
```bash
# Get users without MFA from IAM report
cut -d ',' -f 1,4 iam_users.csv | awk -F ',' '$2 == "false" {print $1}'

# Extract failed SSH IPs and clean output
grep "Failed password" ~/auth.log | cut -d ' ' -f 11 | sed 's/[^0-9\.]//g'

# Extract EC2 IDs & status, format as ID=STATUS
cut -d ',' -f 1,6 ec2_instances.csv | sed 's/,/=/'
```

### Bonus: cut + awk + sed Combined
```bash
# Show usernames of console users WITHOUT MFA
cut -d ',' -f 1,4,5 iam_users.csv | sed '1d' | awk -F ',' '$2 == "false" && $3 == "true" {print $1}'
```
