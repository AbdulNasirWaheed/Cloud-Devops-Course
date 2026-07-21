# Day-20: Archiving Operations

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Create and verify compressed tar archives (`.tar.gz` and `.tar.bz2`) and simulate real-world backup and restore workflows using the `tar` command.

## 🏭 Industry Scenario
Junior DevOps Engineer at a SaaS firm archiving logs and configs daily for debugging and audits. Mastering `tar` is essential for packaging and transferring application bundles in production.

## ✅ What I Practiced

### Task 1: Create and Extract Raw tar Archive
```bash
tar -cvf ~/backup-assignment/raw-backup.tar \
  ~/backup-assignment/app-logs \
  ~/backup-assignment/configs \
  ~/backup-assignment/docs

tar -tvf ~/backup-assignment/raw-backup.tar
tar -xvf ~/backup-assignment/raw-backup.tar -C ~/backup-assignment/extracted-raw
```

### Task 2: Compressed tar.gz Archive (tar + gzip)
```bash
tar -czvf ~/backup-assignment/compressed-backup.tar.gz \
  ~/backup-assignment/app-logs \
  ~/backup-assignment/configs \
  ~/backup-assignment/docs

tar -xzvf ~/backup-assignment/compressed-backup.tar.gz -C ~/backup-assignment/extracted-gz
```

### Task 3: Compressed tar.bz2 Archive (tar + bzip2)
```bash
tar -cjvf ~/backup-assignment/compressed-backup.tar.bz2 \
  ~/backup-assignment/app-logs \
  ~/backup-assignment/configs

tar -xjvf ~/backup-assignment/compressed-backup.tar.bz2 -C ~/backup-assignment/extracted-bz2
```

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

## 📊 Archive Formats Comparison

| Format | Command | Compression | Speed | Best For |
|--------|---------|-------------|-------|----------|
| `.tar` | `tar -cvf` | None | Fastest | Archiving only |
| `.tar.gz` | `tar -czvf` | gzip | Fast | General backups |
| `.tar.bz2` | `tar -cjvf` | bzip2 | Slower | Better compression |

## 🗂️ Repository Contents
- `commands.md` — Full command reference
- `Untitled.png` through `Untitled4.png` — Archive creation and extraction screenshots

## 💡 Key Learnings
- `tar -tvf` lists archive contents **without extracting** — always verify before restore!
- In production, `.tar.gz` is the most common format for log and config backups
- Always store backups in a **separate directory** from the source
- Use `-C` to control extraction destination and avoid clutter

---

**Day 20 Complete** ✅

Production-ready archiving and backup with tar.

#DevOps #AWS #Linux #tar #Backup #100DaysOfDevOps
