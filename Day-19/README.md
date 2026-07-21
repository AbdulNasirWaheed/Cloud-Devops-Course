# Day-19: Data Compression & Restores

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Compress and decompress files using Linux compression tools (`gzip`, `bzip2`, `zip`) and simulate real-world backup and restore workflows.

## 🏭 Industry Scenario
Junior DevOps Engineer at a SaaS firm archiving logs and configs daily for debugging and audits. Needs to choose the right compression tool for each use case.

## ✅ What I Practiced

### Task 1: gzip — Compress & Decompress a Single File
```bash
gzip ~/backup-assignment/app-logs/log1.txt
gzip -d ~/backup-assignment/app-logs/log1.txt.gz
```

### Task 2: zip — Archive Multiple Files & Directories
```bash
zip -r ~/backup-assignment/full-backup.zip \
  ~/backup-assignment/app-logs/log2.txt \
  ~/backup-assignment/configs/app.conf \
  ~/backup-assignment/docs/

unzip -l ~/backup-assignment/full-backup.zip
unzip ~/backup-assignment/full-backup.zip -d ~/backup-assignment/restored
```

### Task 3: bzip2 — Compress & Decompress
```bash
bzip2 ~/backup-assignment/configs/env.conf
bunzip2 ~/backup-assignment/configs/env.conf.bz2
```

## 📊 Compression Tools Comparison

| Tool | Extension | Command | Best For |
|------|-----------|---------|----------|
| `gzip` | `.gz` | `gzip file` / `gzip -d file.gz` | Single file, fast compression |
| `bzip2` | `.bz2` | `bzip2 file` / `bunzip2 file.bz2` | Better compression ratio |
| `zip` | `.zip` | `zip -r archive.zip files` | Multiple files, cross-platform |

## 🗂️ Repository Contents
- `commands.md` — Full command reference
- `Untitled.png` through `Untitled3.png` — Compression workflow screenshots

## 💡 Key Learnings
- `gzip` and `bzip2` compress **single files** and replace the original
- `zip` can archive **multiple files and directories** while preserving structure
- `bzip2` offers better compression than `gzip` but is slower
- `unzip -l` lets you preview archive contents before extracting
- Always verify backup contents before deleting originals!

---

**Day 19 Complete** ✅

Compression and backup skills for production DevOps environments.

#DevOps #AWS #Linux #Backup #Compression #100DaysOfDevOps
