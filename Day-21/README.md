# Day-21: Soft Links vs. Hard Links

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Understand the difference between soft (symbolic) links and hard links, manage filesystem inodes, and apply links to real-world cloud configuration management.

## 🏭 Industry Scenario
DevOps team at CloudX Solutions managing a central nginx config file across multiple environments (dev, staging, prod) using soft and hard links to avoid duplication and ensure consistency.

## ✅ What I Practiced

### Task 1: Setup the Environment
```bash
mkdir -p ~/cloudx/configs
echo "user nginx;" > ~/cloudx/configs/nginx.conf
```

### Task 2: Create a Soft Link
```bash
mkdir -p ~/cloudx/dev-env
ln -s ~/cloudx/configs/nginx.conf ~/cloudx/dev-env/nginx.conf
ls -l ~/cloudx/dev-env/nginx.conf
```

### Task 3: Create a Hard Link
```bash
mkdir -p ~/cloudx/monitoring
ln ~/cloudx/configs/nginx.conf ~/cloudx/monitoring/nginx.conf
ls -li ~/cloudx/configs/nginx.conf ~/cloudx/monitoring/nginx.conf
```

### Task 4: Test Soft Link Behavior (Original Deleted)
```bash
rm ~/cloudx/configs/nginx.conf
cat ~/cloudx/dev-env/nginx.conf
# Result: Broken link ❌
```

### Task 5: Test Hard Link Behavior (Original Deleted)
```bash
cat ~/cloudx/monitoring/nginx.conf
# Result: Still works — same inode ✅
```

## 📊 Soft Link vs Hard Link Comparison

| Feature | Soft Link (Symbolic) | Hard Link |
|---------|---------------------|-----------|
| Created with | `ln -s source dest` | `ln source dest` |
| Points to | File **path** | File **inode (data)** |
| Original deleted? | ❌ Broken link | ✅ File still accessible |
| Inode | **Different** from original | **Same** as original |
| Cross filesystem | ✅ Yes | ❌ No |
| Shows in `ls -l` | `l` prefix + `->` arrow | Regular file appearance |
| Use case | Dynamic config references | Backups, stable access |

## 🗂️ Repository Contents
- `commands.md` — Full command reference
- `Untitled.png` through `Untitled1.png` — Link creation and verification screenshots

## 💡 Key Learnings
- `ln -s` creates a soft/symbolic link — like a desktop shortcut
- `ln` (without `-s`) creates a hard link — a second name for the same data
- Soft links break when the original file is deleted
- Hard links survive original file deletion — data stays until ALL hard links are removed
- Use `ls -li` to see inode numbers and verify hard links
- Soft links are preferred in DevOps for config management across environments

---

**Day 21 Complete** ✅

Filesystem linking mastered for efficient cloud config management.

#DevOps #AWS #Linux #Links #Filesystem #100DaysOfDevOps
