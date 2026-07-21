# Lecture 29 — Real-Time Log Analysis Using `cut` in Linux

## Industry Scenario
You are a Cloud Administrator at a SaaS company hosting services on AWS and Azure.  
Your job: extract specific data from system reports to build a compliance dashboard covering EC2 status, IAM users, SSH access, and server performance.

---

## 📁 Setup: Create Dummy Files

```bash
# 1. users.csv
cat > ~/users.csv <<EOF
username,email,role
john,john@example.com,admin
alice,alice@example.com,developer
bob,bob@example.com,analyst
EOF

# 2. ec2_instances.csv
cat > ~/ec2_instances.csv <<EOF
i-0a1b2c3d4e5f6g7h,WebServer,t2.micro,us-east-1a,34.205.10.1,running
i-1a2b3c4d5e6f7g8h,DBServer,t2.medium,us-west-2b,52.13.45.10,stopped
i-9z8y7x6w5v4u3t2s,AppServer,t3.small,eu-central-1a,18.184.22.99,running
EOF

# 3. auth.log
cat > ~/auth.log <<EOF
May 27 10:23:44 server sshd[12345]: Accepted password for admin from 192.168.1.5 port 45520
May 27 10:25:10 server sshd[12347]: Failed password for root from 203.0.113.15 port 49821
May 27 10:26:11 server sshd[12349]: Failed password for user1 from 198.51.100.22 port 50731
EOF

# 4. iam_users.csv
cat > ~/iam_users.csv <<EOF
username,created_date,password_enabled,mfa_active,console_access
dev_user,2024-01-15,true,true,true
admin_user,2023-12-01,true,false,true
read_only,2024-05-01,false,false,false
EOF
```

---

## 🔰 Basic Syntax

```bash
cut -d [delimiter] -f [field_number] [file]
```

| Flag | Meaning                          |
|------|----------------------------------|
| `-d` | Delimiter (e.g. `,` `:` ` `)    |
| `-f` | Field number(s) to extract       |
| `-c` | Extract by character position    |

---

## 🧪 Basic Examples

```bash
# Example 1: Extract usernames from /etc/passwd (1st column)
cut -d ':' -f 1 /etc/passwd

# Example 2: Get the shell of each user (7th column)
cut -d ':' -f 7 /etc/passwd
```

---

## ⚙️ Intermediate Usage

```bash
# Example 3: Combine with grep to filter then extract
grep "bash" /etc/passwd | cut -d ':' -f 1

# Example 4: Extract multiple fields at once
cut -d ':' -f 1,7 /etc/passwd

# Example 5: Use with cat and pipe
cat ~/users.csv | cut -d ',' -f 2
```

---

## 🚀 Advanced Usage

```bash
# Example 6: Extract AWS instance IDs from a CSV
cat ~/ec2_instances.csv | cut -d ',' -f 1

# Example 7a: Get names of running instances using cut
grep "running" ~/ec2_instances.csv | cut -d ',' -f 2

# Example 7b: Same result using awk (more flexible)
awk -F',' '/running/ { print $2 }' ~/ec2_instances.csv
```

---

## 💼 Cloud Admin Use Cases

```bash
# Use Case 1: Extract IAM usernames from CSV report
cut -d ',' -f 1 ~/iam_users.csv

# Use Case 2: Display EC2 instance IDs and server names
cut -d ',' -f 1,2 ~/ec2_instances.csv

# Use Case 3: Get list of all public IPs from EC2 inventory
cut -d ',' -f 5 ~/ec2_instances.csv
```

---

## 🔗 Combined Example: Real-Time Cloud Log Audit

```bash
# Goal: Find all failed SSH login attempts and extract attacker IPs
grep "Failed password" ~/auth.log | cut -d ' ' -f 11
```

**How it works:**
- `grep "Failed password"` — filters only failed login lines
- `cut -d ' ' -f 11` — extracts the 11th space-separated field (the IP address)

---

## 🛠️ Practice Tasks

```bash
# Task 1: Find all successful SSH logins
grep "Accepted password" /var/log/auth.log

# Task 2: Extract all public IPs from EC2 logs
cat ec2_logs.txt | grep "PublicIp" | cut -d ':' -f 2

# Task 3: Show all users using /bin/bash shell
grep "/bin/bash" /etc/passwd | cut -d ':' -f 1

# Task 4: Extract CPU usage values and strip the '%' symbol
cut -d ',' -f 3 perf_log.txt | cut -d ':' -f 2 | sed 's/%//'
```

---

## 📊 Quick Reference Table

| Command                              | Purpose                    | Cloud Admin Use Case         |
|--------------------------------------|----------------------------|------------------------------|
| `grep "ERROR" file`                  | Find errors                | Check application logs       |
| `grep -r "pattern" dir/`             | Recursive search           | Scan config directories      |
| `cut -d ':' -f 1`                    | Extract 1st field          | Parse system user list       |
| `grep "ssh" \| cut -d ' ' -f 11`    | Filter + extract field     | Get SSH attacker IPs         |
| `grep -v "127.0.0.1"`               | Exclude local IPs          | Filter access logs           |
| `cut -d ',' -f 1,2`                 | Extract multiple columns   | EC2 ID + name from inventory |
| `cut -d ',' -f 5`                   | Extract 5th column         | Pull public IPs from CSV     |
