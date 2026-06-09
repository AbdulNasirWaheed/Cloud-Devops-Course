# 📅 Day 19 — Backup and Restore Operations using Linux Compression
> **Course:** Mise Academy DevOps Batch  
> **Environment:** KillerCoda (Ubuntu 24.04) / AWS EC2  
> **Scenario:** Junior DevOps Engineer at a SaaS firm archiving logs and configs daily for debugging and audits

---

## 🎯 Objectives
- Simulate real-world backup and restoration using Linux archiving tools
- Compress and decompress files using `gzip`, `bzip2`, and `zip`
- Archive multiple files and directories
- Restore files from backups

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

## 🔹 Task 1: gzip — Compress & Decompress a Single File

### Compress
```bash
gzip ~/backup-assignment/app-logs/log1.txt
```
**Output:** (silent — file is replaced with `.gz` version)

### Verify
```bash
ls ~/backup-assignment/app-logs
```
**Output:** `log1.txt.gz  log2.txt`

### Decompress
```bash
gzip -d ~/backup-assignment/app-logs/log1.txt.gz
```
**Output:** (silent — `.gz` removed, original file restored)

### Verify
```bash
ls ~/backup-assignment/app-logs
```
**Output:** `log1.txt  log2.txt`

---

## 🔹 Task 2: zip — Archive Multiple Files & Directories

### Create zip archive
```bash
zip -r ~/backup-assignment/full-backup.zip \
  ~/backup-assignment/app-logs/log2.txt \
  ~/backup-assignment/configs/app.conf \
  ~/backup-assignment/docs/
```

**Output:**
```
adding: home/student/backup-assignment/app-logs/log2.txt (deflated 23%)
adding: home/student/backup-assignment/configs/app.conf (deflated 18%)
adding: home/student/backup-assignment/docs/ (stored 0%)
adding: home/student/backup-assignment/docs/readme.txt (deflated 13%)
```

### List contents of zip
```bash
unzip -l ~/backup-assignment/full-backup.zip
```

**Output:**
```
Archive:  /home/student/backup-assignment/full-backup.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
       27  2025-05-11 11:00   .../app-logs/log2.txt
       15  2025-05-11 11:00   .../configs/app.conf
        0  2025-05-11 11:00   .../docs/
       31  2025-05-11 11:00   .../docs/readme.txt
---------                     -------
       73                     4 files
```

### Extract zip
```bash
unzip ~/backup-assignment/full-backup.zip -d ~/backup-assignment/restored
```

**Output:**
```
inflating: .../app-logs/log2.txt
inflating: .../configs/app.conf
inflating: .../docs/readme.txt
```

---

## 🔹 Task 3: bzip2 — Compress & Decompress

### Compress
```bash
bzip2 ~/backup-assignment/configs/env.conf
```
**Output:** (silent — file replaced with `.bz2`)

### Verify
```bash
ls ~/backup-assignment/configs
```
**Output:** `app.conf  env.conf.bz2`

### Decompress
```bash
bunzip2 ~/backup-assignment/configs/env.conf.bz2
```

### Verify
```bash
ls ~/backup-assignment/configs
```
**Output:** `app.conf  env.conf`

---

## 📊 Compression Tools Comparison

| Tool | Extension | Command | Best For |
|------|-----------|---------|----------|
| `gzip` | `.gz` | `gzip file` / `gzip -d file.gz` | Single file, fast compression |
| `bzip2` | `.bz2` | `bzip2 file` / `bunzip2 file.bz2` | Better compression ratio |
| `zip` | `.zip` | `zip -r archive.zip files` | Multiple files, cross-platform |

---

## 📌 tar Flag Reference

| Flag | Meaning |
|------|---------|
| `-c` | Create archive |
| `-v` | Verbose (show progress) |
| `-f` | Specify filename |
| `-x` | Extract archive |
| `-z` | Use gzip compression |
| `-j` | Use bzip2 compression |
| `-t` | List contents |

---

## 💡 Key Learnings
- `gzip` and `bzip2` compress **single files** and replace the original
- `zip` can archive **multiple files and directories** while preserving structure
- `bzip2` offers better compression than `gzip` but is slower
- `unzip -l` lets you preview archive contents before extracting
- These tools are essential for daily backup routines in production DevOps environments
- Always verify backup contents before deleting originals!

---

## 🔧 Tools & Environment Used
- **KillerCoda** — Ubuntu 24.04 Playground
- **Mise Academy** DevOps Batch
