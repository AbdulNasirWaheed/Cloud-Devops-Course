# 🐧 DevOps/Cloud Practice Journey
> Daily hands-on Linux & DevOps command practice as part of **Mise Academy DevOps Batch**  
> Practiced on real AWS, Ubuntu 24.04 servers via KillerCoda, JSLinux & AWS EC2

---

## 👨‍💻 About This Repository

This repository documents my daily DevOps learning journey — every command practiced, every concept learned, with real terminal screenshots as proof of work.

Each day includes:
- 📝 `commands.md` — All commands practiced with outputs and explanations
- 📸 Screenshot(s) from live terminal sessions

---

## 📈 Progress Tracker

| Day | Topic | Key Commands | Environment | Status |
|-----|-------|-------------|-------------|--------|
| Day 11 | Git & GitHub Basics | `git init`, `git add`, `git commit`, `git push`, `git clone` | Local + GitHub | ✅ Done |
| Day 12 | Create AWS Account & Linux Server on EC2 | AWS Console, EC2 setup, SSH connection | AWS Console | ✅ Done |
| Day 13 | Basic Linux Commands | `pwd`, `ls`, `mkdir`, `touch`, `rm`, `cat`, `cp`, `mv`, `tail -f` | KillerCoda / JSLinux | ✅ Done |
| Day 14 | User & Group Management | `adduser`, `groupadd`, `usermod -aG`, `grep /etc/passwd` | KillerCoda | ✅ Done |
| Day 15 | Basic Linux Commands (Practice) | `pwd`, `ls -al`, `mkdir`, `touch`, `rm`, `cat`, `cp`, `mv`, `tail -f`, `journalctl` | KillerCoda | ✅ Done |
| Day 16 | Linux File System, User & Group Management | `adduser`, `groupadd`, `usermod -aG`, `getent`, `grep /etc/group` | KillerCoda | ✅ Done |
| Day 17 | Configuring User & Group Permissions | `chmod`, `chown`, `gpasswd`, `userdel`, `groupdel`, `ls -li` | KillerCoda | ✅ Done |
| Day 18 | File & Cloud Access Control — chmod + AWS IAM | `chmod 700/755/644/600`, `ssh`, IAM users, IAM groups, `AmazonEC2ReadOnlyAccess` | AWS EC2 + IAM Console | ✅ Done |
| Day 19 | Backup & Restore — Linux Compression | `gzip`, `gzip -d`, `zip`, `unzip`, `bzip2`, `bunzip2` | KillerCoda | ✅ Done |
| Day 20 | Backup & Restore — Linux tar Archiving | `tar -cvf`, `tar -tvf`, `tar -xvf`, `tar -czvf`, `tar -cjvf` | KillerCoda | ✅ Done |
| Day 21 | Soft Links & Hard Links | `ln -s`, `ln`, `ls -li`, inode verification | KillerCoda | ✅ Done |
| Day 22 | System Level Linux Commands | `uname`, `hostname`, `uptime`, `free`, `df`, `top`, `htop`, `vmstat`, `ps`, `kill`, `apt`, `systemctl` | KillerCoda + AWS EC2 | ✅ Done |

---

## 🗂️ Repository Structure

```
Cloud-Devops-Course/
├── README.md
├── Day-11/
│   ├── commands.md
│   └── screenshot.png
├── Day-12/
│   ├── commands.md
│   └── screenshot.png
├── Day-13/
│   ├── commands.md
│   └── screenshot.png
├── Day-14/
│   ├── commands.md
│   └── screenshot.png
├── Day-15/
│   ├── commands.md
│   └── screenshot.png
├── Day-16/
│   ├── commands.md
│   └── screenshot.png
├── Day-17/
│   ├── commands.md
│   └── screenshot.png
├── Day-18/
│   ├── commands.md
│   └── screenshot.png
├── Day-19/
│   ├── commands.md
│   └── screenshot.png
├── Day-20/
│   ├── commands.md
│   └── screenshot.png
├── Day-21/
│   ├── commands.md
│   └── screenshot.png
└── Day-22/
    ├── commands.md
    └── screenshot.png
```

---

## 🔧 Tools & Environment

| Tool | Purpose |
|------|---------|
| [KillerCoda](https://killercoda.com) | Ubuntu 24.04 — full systemd, journalctl, Docker support |
| [JSLinux](https://bellard.org/jslinux) | Alpine x86 — lightweight browser Linux for basics |
| [AWS EC2](https://aws.amazon.com/ec2) | Real Ubuntu cloud server — SSH, IAM, chmod practice |
| [AWS IAM](https://aws.amazon.com/iam) | Identity & Access Management — users, groups, policies |
| Mise Academy | DevOps Batch course |

---

## 🌱 Skills Being Built

- ✅ Git & GitHub — version control, push, clone, branching
- ✅ AWS Account Setup & EC2 Instance Creation
- ✅ Linux File System Navigation
- ✅ File & Directory Management
- ✅ User & Group Administration
- ✅ File Permissions & Access Control (chmod, chown, RBAC)
- ✅ AWS IAM — Users, Groups, Policies, Least Privilege
- ✅ Linux Compression & Archiving (gzip, bzip2, zip, tar)
- ✅ Soft Links & Hard Links (Inodes)
- ✅ System Diagnostics & Process Monitoring (top, htop, vmstat)
- ✅ Package Management (apt, dpkg)
- ✅ Service Management (systemctl)
- 🔜 Shell Scripting & Automation
- 🔜 Networking Commands
- 🔜 Docker & Containers
- 🔜 CI/CD Pipelines
- 🔜 Terraform & Infrastructure as Code

---

## 📚 Key Concepts Covered

### 🐧 Linux
- File system hierarchy (/, /home, /etc, /var, /usr)
- Absolute vs relative paths
- User/group management and RBAC
- chmod numeric and symbolic modes
- Hard links vs soft links and inodes
- Process monitoring and CPU/memory stress testing
- Service lifecycle management with systemctl

### ☁️ AWS Cloud
- AWS regions and availability zones
- EC2 instance creation, SSH access, security groups
- IAM users, groups, and policies
- Least Privilege Principle in action
- AWS Free Tier usage

### 🔧 DevOps Tools
- Git workflow: init → add → commit → push
- GitHub branching strategy and pull requests
- Backup automation with tar, gzip, bzip2

---

## 📬 Connect With Me

- **LinkedIn:** https://www.linkedin.com/in/abdul-nasir-waheed-47727a80/
- **GitHub:** https://github.com/AbdulNasirWaheed

---

> *"Every expert was once a beginner. Consistency is the key!"* 💪
