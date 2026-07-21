# Day-18: Commands Reference
> **Course:** Mise Academy DevOps Batch  
> **Environment:** Real AWS EC2 Instance (Ubuntu 26.04 LTS) + AWS Management Console  
> **Scenario:** Cloud Administrator at CloudFinTech Ltd. setting up a new DevOps environment with Linux file permissions and AWS IAM access control

---

## 🎯 Objectives
- Change file permissions using `chmod` on a real EC2 instance
- Create IAM users and assign roles
- Create an IAM group and assign users to it
- Sign in as an IAM user
- Verify read-only EC2 access (Least Privilege Principle)

---

## 🔗 Part 1: Connect to EC2 via SSH

```bash
# Set correct permissions on the PEM key file first
chmod 400 "ubuntu.pem"

# SSH into EC2 instance
ssh -i "ubuntu.pem" ubuntu@ec2-16-171-142-147.eu-north-1.compute.amazonaws.com
```

**Output on successful connection:**
```
Welcome to Ubuntu 26.04 LTS (GNU/Linux 7.0.0-1004-aws x86_64)
System load:  0.08        Temperature: -273.1 C
Usage of /:   30.4% of 6.61GB
IPv4 address for ens5: 172.31.37.122
ubuntu@ip-172-31-37-122:~$
```

> ✅ Connected to a **real AWS EC2 instance** — not a browser simulator!

---

## 🔐 Part 2: Linux File Permissions — chmod

### Setup: Create and secure backup.sh
```bash
# Create the script file
touch backup.sh

# Add content
echo "Currently, I am learning IAM user creation" > backup.sh

# Secure it — owner only full access
chmod 700 backup.sh

# Verify
ls -l backup.sh
```
**Output:** `-rwx------ 1 ubuntu ubuntu 44 Jun 9 17:48 backup.sh`

---

### 1. chmod 700 — Owner Full Access Only
```bash
touch deploy.sh
chmod 700 deploy.sh
ls -l deploy.sh
```
**Output:** `-rwx------ 1 ubuntu ubuntu 0 Jun 9 17:51 deploy.sh`  
**Use case:** Sensitive deploy scripts — only the owner can read, write, execute.

---

### 2. chmod 755 — Public Script
```bash
touch install.sh
chmod 755 install.sh
ls -l install.sh
```
**Output:** `-rwxr-xr-x 1 ubuntu ubuntu 0 Jun 9 17:52 install.sh`  
**Use case:** Installation scripts everyone can run, but only owner can edit.

---

### 3. chmod 644 — Config File
```bash
touch config.json
chmod 644 config.json
ls -l config.json
```
**Output:** `-rw-r--r-- 1 ubuntu ubuntu 0 Jun 9 17:52 config.json`  
**Use case:** Configuration files — owner edits, everyone reads.

---

### 4. chmod 600 — Private Key File
```bash
touch private.pem
chmod 600 private.pem
ls -l private.pem
```
**Output:** `-rw------- 1 ubuntu ubuntu 0 Jun 9 17:53 private.pem`  
**Use case:** SSH private keys — AWS rejects keys with looser permissions!

---

### 5. chmod 777 — Full Open Access (⚠️ Test Only)
```bash
touch shared.log
chmod 777 shared.log
ls -l shared.log
```
**Output:** `-rwxrwxrwx 1 ubuntu ubuntu 0 Jun 9 17:54 shared.log`  
**Use case:** Temporary shared log files in test environments only. Never in production!

---

### 6. chmod +x — Add Execute Permission
```bash
touch script.sh
chmod +x script.sh
ls -l script.sh
```
**Output:** `-rwxr--r-- 1 ubuntu ubuntu 0 Jun 9 17:55 script.sh`  
**Use case:** Make a script executable without changing other permissions.

---

### 7. chmod -x — Remove Execute Permission
```bash
touch report.sh
chmod -x report.sh
ls -l report.sh
```
**Output:** `-rw-r--r-- 1 ubuntu ubuntu 0 Jun 9 17:55 report.sh`  
**Use case:** Restrict a script accidentally made executable.

---

### 📊 chmod Quick Reference Table

| Command | Permissions | Use Case |
|---------|------------|----------|
| `chmod 700` | `rwx------` | Secure/private scripts |
| `chmod 755` | `rwxr-xr-x` | Public executable scripts |
| `chmod 644` | `rw-r--r--` | Config and text files |
| `chmod 600` | `rw-------` | SSH private keys (.pem) |
| `chmod 777` | `rwxrwxrwx` | Test only — never production |
| `chmod +x` | adds `x` | Make script executable |
| `chmod -x` | removes `x` | Remove execute permission |

---

## ☁️ Part 3: AWS IAM — Create User & Assign Role

> **IAM = Identity and Access Management**  
> An IAM user is like an employee ID badge — they can only access what they're authorized for.

### Steps performed in AWS Console:
```
IAM → Users → Create user
  Username:   devops_user1
  Access:     AWS Management Console access
  Password:   Auto-generated
```

**Result:** ✅ `devops_user1` created successfully  
**Console sign-in URL:** `https://375973130701.signin.aws.amazon.com/console`

---

## 👥 Part 4: Create IAM Group & Assign Policy

```
IAM → User Groups → Create group
  Group name:  DevOpsReadOnly
  Add user:    devops_user1 ✅
  Policy:      AmazonEC2ReadOnlyAccess ✅
```

**Result:** ✅ `DevOpsReadOnly` group created with 1 user, permissions defined.

---

## 🔑 Part 5: Sign In as IAM User

```
URL:       https://375973130701.signin.aws.amazon.com/console
Username:  devops_user1
Password:  ************
```

**Result:** ✅ Successfully signed in as `devops_user1`

---

## ✅ Part 6: Verify Permissions (Least Privilege in Action)

### EC2 Read — ALLOWED ✅
```
EC2 → Instances → View list
Result: Ubuntu Server (i-01db6c20a128115b1) — Running — t3.micro ✅
```

### EC2 Launch — DENIED ❌
```
EC2 → Launch Instance → (attempt)
Result: "You are not authorized to perform this operation.
         ec2:CreateSecurityGroup action denied for devops_user1"
```

> 🎯 **This is exactly what Least Privilege looks like in practice!**  
> The IAM user can VIEW instances but CANNOT create or modify them.

---

## 💡 Key Learnings

- SSH into a real AWS EC2 instance using a `.pem` key file
- Always `chmod 400` your `.pem` key before using it — AWS enforces this
- Linux `chmod` controls who can read/write/execute files locally
- AWS IAM controls who can access cloud resources
- **Least Privilege Principle** = give users only the permissions they need, nothing more
- IAM Groups make permission management scalable — assign policies to groups, not individuals
- A read-only user CAN view EC2 instances but CANNOT launch new ones — verified live!

---

## 🔧 Tools & Environment Used
- **AWS EC2** — Ubuntu 26.04 LTS (t3.micro, eu-north-1)
- **AWS IAM** — Identity and Access Management Console
- **Git Bash / MINGW64** — SSH client on Windows
- **Mise Academy** DevOps Batch
