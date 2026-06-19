# Lecture 28 — Real-Time Log Analysis Using `grep` in Linux

## Industry Scenario
You are a Junior DevOps Engineer at a cloud-based SaaS company managing AWS EC2 instances.  
Your daily job: monitor production logs, detect errors, audit SSH access, and validate configs using `grep`, `awk`, `sed`, and `cut`.

---

## 📁 Setup: Create Dummy Log Files

```bash
# 1. syslog.log
sudo tee /home/ubuntu/syslog.log > /dev/null <<EOF
May 29 10:32:16 ip-172-31-12-45 systemd[1]: Started Session 4 of user ubuntu.
May 29 10:33:18 ip-172-31-12-45 sshd[1234]: Failed password for invalid user root from 192.168.1.10 port 54822 ssh2
May 29 10:35:20 ip-172-31-12-45 sshd[1234]: Accepted password for ubuntu from 192.168.1.11 port 54823 ssh2
May 29 10:36:21 ip-172-31-12-45 nginx[4321]: error: failed to connect to upstream
May 29 10:37:22 ip-172-31-12-45 nginx[4321]: warning: connection timeout
May 29 10:38:23 ip-172-31-12-45 systemd[1]: Reached target Timers.
EOF

# 2. auth.log
sudo tee /home/ubuntu/auth.log > /dev/null <<EOF
May 29 10:33:18 ip-172-31-12-45 sshd[1234]: Failed password for root from 10.0.0.5 port 22 ssh2
May 29 10:35:20 ip-172-31-12-45 sshd[1234]: Accepted password for ubuntu from 10.0.0.6 port 22 ssh2
May 29 10:36:21 ip-172-31-12-45 sshd[1234]: Failed password for invalid user admin from 10.0.0.7 port 22 ssh2
May 29 10:36:22 ip-172-31-12-45 sshd[1234]: Accepted publickey for ubuntu from 10.0.0.6 port 22 ssh2
EOF

# 3. sshd_config
sudo tee /home/ubuntu/sshd_config > /dev/null <<EOF
Port 22
PermitRootLogin yes
PasswordAuthentication yes
ChallengeResponseAuthentication no
UsePAM yes
EOF

# 4. security_groups.csv
sudo tee /home/ubuntu/security_groups.csv > /dev/null <<EOF
GroupName,Protocol,PortRange,CIDR
web-sg,tcp,80,0.0.0.0/0
web-sg,tcp,22,192.168.0.0/24
db-sg,tcp,3306,10.0.0.0/16
admin-sg,tcp,22,0.0.0.0/0
EOF
```

---

## 🔰 Basic grep Commands

```bash
# Syntax
grep [options] pattern [file...]

# Example 1: Find a word in a file
grep "error" /var/log/syslog

# Example 2: Case-insensitive search
grep -i "error" /var/log/syslog

# Example 3: Display line numbers
grep -n "failed" /var/log/auth.log

# Example 4: Search recursively in a directory
grep -r "PermitRootLogin" /etc/ssh/
```

---

## ⚙️ Intermediate grep Commands

```bash
# Example 5: Invert match — exclude a pattern
grep -v "127.0.0.1" /etc/hosts

# Example 6: Show only the matched part of each line
grep -o "error.*" /var/log/syslog

# Example 7: Use extended regular expressions (find IP addresses)
grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" /var/log/syslog
```

---

## 🚀 Advanced grep Commands

```bash
# Example 8: Pipe with ps to filter running processes
ps aux | grep nginx

# Example 9: Count occurrences of a pattern
grep -c "sshd" /var/log/auth.log

# Example 10: Highlight matched text in color
grep --color=auto "ssh" /var/log/auth.log
```

---

## 💼 Cloud Admin Use Cases

```bash
# Use Case 1: Monitor EC2 logs for successful operations
grep "SUCCESS" /var/log/cloud-init.log

# Use Case 2: Check successful user login attempts
grep "Accepted" /var/log/auth.log

# Use Case 3: Filter overly permissive security group rules
grep "0.0.0.0/0" ~/security_groups.csv

# Use Case 4: Scan SSH config for weak/insecure settings
grep -E "PermitRootLogin|PasswordAuthentication" ~/sshd_config
```

---

## 🧠 Quick Reference: grep Options

| Option | Description                          | Example                            |
|--------|--------------------------------------|------------------------------------|
| `-i`   | Case-insensitive search              | `grep -i "error" file.log`         |
| `-n`   | Show line numbers                    | `grep -n "fail" auth.log`          |
| `-r`   | Recursive directory search           | `grep -r "root" /etc/ssh/`         |
| `-v`   | Invert match (exclude pattern)       | `grep -v "info" syslog.log`        |
| `-o`   | Print only the matched part          | `grep -o "error.*" syslog.log`     |
| `-E`   | Extended regex                       | `grep -E "([0-9]{1,3}\.){3}"` file |
| `-c`   | Count matching lines                 | `grep -c "sshd" auth.log`          |
| `--color` | Highlight matches                 | `grep --color=auto "ssh" auth.log` |
