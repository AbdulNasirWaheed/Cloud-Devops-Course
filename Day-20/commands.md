# 📅 Day 20 — Backup and Restore Operations using Linux Archiving Commands (tar)
> **Course:** Mise Academy DevOps Batch  
> **Environment:** KillerCoda (Ubuntu 24.04)  
> **Scenario:** Junior DevOps Engineer at a SaaS firm archiving logs and configs daily for debugging and audits

---

## 🎯 Objectives
- Create and extract tar archives (raw, compressed)
- Use `tar` with `gzip` (.tar.gz) and `bzip2` (.tar.bz2) compression
- Simulate real-world backup and restore workflows
- Verify archive contents before extracting

---

## 🗂️ Step 1: Create Directory Structure

```bash
mkdir -p ~/backup-assignment/{app-logs,configs,docs,restored,extracted-raw,extracted-gz,extracted-bz2}
```

---

## 📄 Step 2: Create Dummy Files

```bash
# Log files
echo "ERROR: Disk space low" > ~/backup-assignment/app-logs/log1.txt
echo "INFO: Backup completed successfully" > ~/backup-assignment/app-logs/log2.txt

# Config files
echo "APP_PORT=8080" > ~/backup-assignment/configs/app.conf
echo "ENV=production" > ~/backup-assignment/configs/env.conf

# Docs
echo "This is the README file for backup instructions." > ~/backup-assignment/docs/readme.txt
```

### Verify Structure
```bash
tree ~/backup-assignment
```

**Expected Output:**
```
backup-assignment
├── app-logs
│   ├── log1.txt
│   └── log2.txt
├── configs
│   ├── app.conf
│   └── env.conf
├── docs
│   └── readme.txt
├── restored
├── extracted-raw
├── extracted-gz
└── extracted-bz2
```

---

## 🔹 Task 1: Create and Extract Raw tar Archive

### Create tar archive
```bash
tar -cvf ~/backup-assignment/raw-backup.tar \
  ~/backup-assignment/app-logs \
  ~/backup-assignment/configs \
  ~/backup-assignment/docs
```

**Output:**
```
home/student/backup-assignment/app-logs/
home/student/backup-assignment/app-logs/log1.txt
home/student/backup-assignment/app-logs/log2.txt
home/student/backup-assignment/configs/
home/student/backup-assignment/configs/app.conf
home/student/backup-assignment/configs/env.conf
home/student/backup-assignment/docs/
home/student/backup-assignment/docs/readme.txt
```

### View contents without extracting
```bash
tar -tvf ~/backup-assignment/raw-backup.tar
```

**Output:**
```
drwxr-xr-x student/student  0 2025-05-11 11:00 backup-assignment/app-logs/
-rw-r--r-- student/student 27 2025-05-11 11:00 backup-assignment/app-logs/log1.txt
-rw-r--r-- student/student 30 2025-05-11 11:00 backup-assignment/app-logs/log2.txt
-rw-r--r-- student/student 15 2025-05-11 11:00 backup-assignment/configs/app.conf
-rw-r--r-- student/student 24 2025-05-11 11:00 backup-assignment/configs/env.conf
-rw-r--r-- student/student 31 2025-05-11 11:00 backup-assignment/docs/readme.txt
```

### Extract tar archive
```bash
tar -xvf ~/backup-assignment/raw-backup.tar -C ~/backup-assignment/extracted-raw
```

### Verify extraction
```bash
ls ~/backup-assignment/extracted-raw
```

---

## 🔹 Task 2: Compressed tar.gz Archive (tar + gzip)

### Create tar.gz
```bash
tar -czvf ~/backup-assignment/compressed-backup.tar.gz \
  ~/backup-assignment/app-logs \
  ~/backup-assignment/configs \
  ~/backup-assignment/docs
```

**Output:**
```
home/student/backup-assignment/app-logs/
home/student/backup-assignment/app-logs/log1.txt
home/student/backup-assignment/app-logs/log2.txt
home/student/backup-assignment/configs/app.conf
home/student/backup-assignment/configs/env.conf
home/student/backup-assignment/docs/readme.txt
```

### Extract tar.gz
```bash
tar -xzvf ~/backup-assignment/compressed-backup.tar.gz -C ~/backup-assignment/extracted-gz
```

### Verify extraction
```bash
ls ~/backup-assignment/extracted-gz
```

---

## 🔹 Task 3: Compressed tar.bz2 Archive (tar + bzip2)

### Create tar.bz2
```bash
tar -cjvf ~/backup-assignment/compressed-backup.tar.bz2 \
  ~/backup-assignment/app-logs \
  ~/backup-assignment/configs
```

**Output:**
```
home/student/backup-assignment/app-logs/
home/student/backup-assignment/app-logs/log1.txt
home/student/backup-assignment/app-logs/log2.txt
home/student/backup-assignment/configs/
home/student/backup-assignment/configs/app.conf
home/student/backup-assignment/configs/env.conf
```

### Extract tar.bz2
```bash
tar -xjvf ~/backup-assignment/compressed-backup.tar.bz2 -C ~/backup-assignment/extracted-bz2
```

### Verify extraction
```bash
ls ~/backup-assignment/extracted-bz2
```

---

## 📊 tar Flag Reference

| Flag | Meaning |
|------|---------|
| `-c` | **C**reate a new archive |
| `-v` | **V**erbose — show files being processed |
| `-f` | Specify archive **f**ilename |
| `-x` | E**x**tract files from archive |
| `-t` | Lis**t** contents of archive |
| `-z` | Compress/decompress with g**z**ip (.tar.gz) |
| `-j` | Compress/decompress with b**j**zip2 (.tar.bz2) |
| `-C` | Extract to a specific directory |

---

## 📊 Archive Formats Comparison

| Format | Command | Compression | Speed | Best For |
|--------|---------|-------------|-------|----------|
| `.tar` | `tar -cvf` | None | Fastest | Archiving only |
| `.tar.gz` | `tar -czvf` | gzip | Fast | General backups |
| `.tar.bz2` | `tar -cjvf` | bzip2 | Slower | Better compression |

---

## 💡 Key Learnings
- `tar -cvf` creates a raw archive without compression
- `tar -tvf` lists archive contents **without extracting** — always verify before restore!
- `tar -xvf` extracts; use `-C` to specify destination directory
- Adding `-z` uses gzip compression → smaller `.tar.gz` files
- Adding `-j` uses bzip2 compression → even smaller `.tar.bz2` files
- In production, `.tar.gz` is the most common format for log and config backups
- Always store backups in a **separate directory** from the source

---

## 🔧 Tools & Environment Used
- **KillerCoda** — Ubuntu 24.04 Playground
- **Mise Academy** DevOps Batch
