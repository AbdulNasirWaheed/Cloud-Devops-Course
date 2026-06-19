# 🐧 DevOps/Cloud Practice Journey
Daily hands-on Linux & DevOps command practice as part of Mise Academy DevOps Batch  
Practiced on real AWS, Ubuntu 24.04 servers via KillerCoda, JSLinux & AWS EC2

---

## 👨‍💻 About This Repository
This repository documents my daily DevOps learning journey — every command practiced, every concept learned, with real terminal screenshots as proof of work.

Each day includes:
* 📝 `commands.md` — All commands practiced with outputs and explanations
* 📸 Screenshot(s) from live terminal sessions

---

## 📈 Progress Tracker

| Day    | Topic                                                        | Key Commands                                                                 | Environment              | Status   |
|--------|--------------------------------------------------------------|------------------------------------------------------------------------------|--------------------------|----------|
| Day 11 | Git & GitHub Basics                                          | git init, git add, git commit, git push, git clone                           | Local + GitHub           | ✅ Done  |
| Day 12 | Create AWS Account & Linux Server on EC2                     | AWS Console, EC2 setup, SSH connection                                       | AWS Console              | ✅ Done  |
| Day 13 | Basic Linux Commands                                         | pwd, ls, mkdir, touch, rm, cat, cp, mv, tail -f                              | KillerCoda / JSLinux     | ✅ Done  |
| Day 14 | User & Group Management                                      | adduser, groupadd, usermod -aG, grep /etc/passwd                             | KillerCoda               | ✅ Done  |
| Day 15 | Basic Linux Commands (Practice)                              | pwd, ls -al, mkdir, touch, rm, cat, cp, mv, tail -f, journalctl              | KillerCoda               | ✅ Done  |
| Day 16 | Linux File System, User & Group Management                   | adduser, groupadd, usermod -aG, getent, grep /etc/group                      | KillerCoda               | ✅ Done  |
| Day 17 | Configuring User & Group Permissions                         | chmod, chown, gpasswd, userdel, groupdel, ls -li                             | KillerCoda               | ✅ Done  |
| Day 18 | File & Cloud Access Control — chmod + AWS IAM                | chmod 700/755/644/600, ssh, IAM users, IAM groups, AmazonEC2ReadOnlyAccess   | AWS EC2 + IAM Console    | ✅ Done  |
| Day 19 | Backup & Restore — Linux Compression                         | gzip, gzip -d, zip, unzip, bzip2, bunzip2                                    | KillerCoda               | ✅ Done  |
| Day 20 | Backup & Restore — Linux tar Archiving                       | tar -cvf, tar -tvf, tar -xvf, tar -czvf, tar -cjvf                          | KillerCoda               | ✅ Done  |
| Day 21 | Soft Links & Hard Links                                      | ln -s, ln, ls -li, inode verification                                        | KillerCoda               | ✅ Done  |
| Day 22 | System Level Linux Commands                                  | uname, hostname, uptime, free, df, top, htop, vmstat, ps, kill, apt, systemctl | KillerCoda + AWS EC2  | ✅ Done  |
| Day 23 | Attaching & Configuring AWS EBS Volumes                      | lsblk, fdisk, mkfs.ext4, mount, blkid, fstab, chown                         | AWS EC2 + EBS Console    | ✅ Done  |
| Day 24 | Linux Networking & Troubleshooting                           | ip a, ping, curl, netstat, ss, traceroute, nslookup, wget, ufw, grep logs    | AWS EC2                  | ✅ Done  |
| Day 26 | Real-Time Log Analysis Using AWK                             | awk patterns, $1/$NF, BEGIN/END, NF, gsub(), sum/average                     | AWS EC2 + Ubuntu         | ✅ Done  |
| Day 27 | Real-Time Log Analysis & Text Processing Using sed           | sed -i, s/old/new/g, /i /a, -n p, regex, multiple -e                        | AWS EC2 + Ubuntu         | ✅ Done  |
| Day 28 | Real-Time Log Analysis Using grep                            | grep, -i, -n, -r, -v, -o, -E, -c, --color, regex, pipe with ps              | AWS EC2 + Ubuntu         | ✅ Done  |
| Day 29 | Real-Time Log Analysis Using cut                             | cut -d, -f, -c, pipe with grep/awk/sed, CSV parsing, IAM & EC2 auditing     | AWS EC2 + Ubuntu         | ✅ Done  |
| Day 30 | Searching for Files — find & locate + Command Combinations   | find -name/-type/-mtime/-size/-delete, locate, updatedb, cut\|awk\|sed pipelines | AWS EC2 + Ubuntu    | ✅ Done  |

---

## 🗂️ Repository Structure

```
🔧 Cloud-Devops-Course/
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
├── Day-22/
│   ├── commands.md
│   └── screenshot.png
├── Day-23/
│   ├── commands.md
│   └── screenshot.png
├── Day-24/
│   ├── commands.md
│   └── screenshot.png
├── Day-26/
│   ├── commands.md
│   └── screenshot.png
├── Day-27/
│   ├── commands.md
│   └── screenshot.png
├── Day-28/
│   ├── commands.md
│   └── screenshot.png
├── Day-29/
│   ├── commands.md
│   └── screenshot.png
└── Day-30/
    ├── commands.md
    └── screenshot.png
```

---

## 🛠️ Tools & Environment

| Tool          | Purpose                                                              |
|---------------|----------------------------------------------------------------------|
| KillerCoda    | Ubuntu 24.04 — full systemd, journalctl, Docker support             |
| JSLinux       | Alpine x86 — lightweight browser Linux for basics                   |
| AWS EC2       | Real Ubuntu cloud server — SSH, IAM, chmod, EBS, log analysis       |
| AWS IAM       | Identity & Access Management — users, groups, policies              |
| AWS EBS       | Elastic Block Store — cloud disk storage management                 |
| Mise Academy  | DevOps Batch course                                                  |

---

## 🌱 Skills Being Built

* ✅ Git & GitHub — version control, push, clone, branching
* ✅ AWS Account Setup & EC2 Instance Creation
* ✅ Linux File System Navigation
* ✅ File & Directory Management
* ✅ User & Group Administration
* ✅ File Permissions & Access Control (chmod, chown, RBAC)
* ✅ AWS IAM — Users, Groups, Policies, Least Privilege
* ✅ Linux Compression & Archiving (gzip, bzip2, zip, tar)
* ✅ Soft Links & Hard Links (Inodes)
* ✅ System Diagnostics & Process Monitoring (top, htop, vmstat)
* ✅ Package Management (apt, dpkg)
* ✅ Service Management (systemctl)
* ✅ AWS EBS Volume — attach, partition, format, mount, persist
* ✅ Linux Networking & Troubleshooting (ip, ping, netstat, ufw)
* ✅ Advanced Text Processing & Log Analysis (AWK + sed)
* ✅ **Real-Time Log Filtering & Pattern Matching** (grep — regex, recursive, pipe)
* ✅ **Structured Data Extraction from Logs & CSVs** (cut — fields, delimiters, chaining)
* ✅ **File Search & Discovery** (find — filters by name/type/size/time, locate + updatedb)
* 🔜 Shell Scripting & Automation
* 🔜 Docker & Containers
* 🔜 CI/CD Pipelines
* 🔜 Terraform & Infrastructure as Code

---

## 📚 Key Concepts Covered

### 🐧 Linux
* File system hierarchy (/, /home, /etc, /var, /usr)
* Absolute vs relative paths
* User/group management and RBAC
* chmod numeric and symbolic modes
* Hard links vs soft links and inodes
* Process monitoring and CPU/memory stress testing
* Service lifecycle management with systemctl
* Disk partitioning, formatting and mounting
* Network diagnostics and log analysis
* UFW firewall configuration
* **AWK** — pattern matching, filtering, summarization, math operations, log parsing
* **sed** — stream editing, in-place substitution, insert/delete, regex, config management
* **grep** — Global Regular Expression Print; case-insensitive search, line numbers, recursive scan, regex IP extraction, process filtering, occurrence counting
* **cut** — field/column extraction from CSVs and logs using delimiters; combined with grep, awk, and sed for cloud auditing pipelines
* **find** — real-time filesystem search by name, type, size, owner, and modification time; recursive config scanning and automated log cleanup
* **locate** — fast indexed file discovery via updatedb; system-wide file lookup for incident response and QA verification

### ☁️ AWS Cloud
* AWS regions and availability zones
* EC2 instance creation, SSH access, security groups
* IAM users, groups, and policies
* Least Privilege Principle in action
* EBS volume creation, attachment, and persistence via fstab
* AWS Free Tier usage

### 🔧 DevOps Tools
* Git workflow: init → add → commit → push
* GitHub repository management
* Backup automation with tar, gzip, bzip2
* Server security with UFW firewall
* Production log analysis & configuration automation using AWK and sed
* **Security auditing pipelines** — detecting brute-force SSH attempts, surfacing IAM users without MFA, parsing EC2 inventory reports using grep + cut + awk + sed + find

---

## 📬 Connect With Me

* LinkedIn: https://www.linkedin.com/in/abdul-nasir-waheed-47727a80/
* GitHub: https://github.com/AbdulNasirWaheed

---

> *"Every expert was once a beginner. Consistency is the key!"* 💪
