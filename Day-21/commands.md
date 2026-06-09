# 📅 Day 21 — Understanding Soft Links and Hard Links in Linux
> **Course:** Mise Academy DevOps Batch  
> **Environment:** KillerCoda (Ubuntu 24.04)  
> **Scenario:** DevOps team at CloudX Solutions managing a central nginx config file across multiple environments using soft and hard links

---

## 🎯 Objectives
- Understand the difference between soft links and hard links
- Create and verify soft (symbolic) links
- Create and verify hard links
- Test behavior of both link types when the original file is deleted
- Understand inodes and how they relate to links

---

## 🧠 Key Concepts

| Concept | Explanation |
|---------|-------------|
| **Soft Link** | A shortcut that points to the original file's **path** |
| **Hard Link** | A direct reference to the file's **data on disk (inode)** |
| **Inode** | A unique number the filesystem uses to identify a file |

```
Soft Link:  dev-env/nginx.conf  ──path──►  configs/nginx.conf (real file)
Hard Link:  monitoring/nginx.conf  ══inode══  configs/nginx.conf (same data)
```

---

## 🔹 Task 1: Setup the Environment

```bash
# Create configs directory and the original file
mkdir -p ~/cloudx/configs
echo "user nginx;" > ~/cloudx/configs/nginx.conf

# Verify
cat ~/cloudx/configs/nginx.conf
```

**Output:** `user nginx;`

---

## 🔹 Task 2: Create a Soft Link

> **Scenario:** Dev environment should always point to the latest version of the config.

```bash
# Create the dev-env directory
mkdir -p ~/cloudx/dev-env

# Create soft link
ln -s ~/cloudx/configs/nginx.conf ~/cloudx/dev-env/nginx.conf

# Verify
ls -l ~/cloudx/dev-env/nginx.conf
```

**Expected Output:**
```
lrwxrwxrwx 1 root root 34 May 11 10:00 ~/cloudx/dev-env/nginx.conf -> ~/cloudx/configs/nginx.conf
```

> The `l` at start and `->` arrow confirm it's a **symbolic link** ✅

---

## 🔹 Task 3: Create a Hard Link

> **Scenario:** Monitoring tool needs stable access to config even if original is deleted.

```bash
# Create monitoring directory
mkdir -p ~/cloudx/monitoring

# Create hard link
ln ~/cloudx/configs/nginx.conf ~/cloudx/monitoring/nginx.conf

# Verify — check inode numbers with -i flag
ls -li ~/cloudx/configs/nginx.conf ~/cloudx/monitoring/nginx.conf
```

**Expected Output:**
```
1234567 -rw-r--r-- 2 root root 15 May 11 10:00 ~/cloudx/configs/nginx.conf
1234567 -rw-r--r-- 2 root root 15 May 11 10:00 ~/cloudx/monitoring/nginx.conf
```

> Same inode number (`1234567`) confirms both files point to the **same data on disk** ✅  
> The `2` in link count means two hard links exist for this inode.

---

## 🔹 Task 4: Test Soft Link Behavior (Original Deleted)

```bash
# Delete the original file
rm ~/cloudx/configs/nginx.conf

# Try reading through the soft link
cat ~/cloudx/dev-env/nginx.conf
```

**Expected Output:**
```
cat: ~/cloudx/dev-env/nginx.conf: No such file or directory
```

> ❌ Soft link is **broken** — it pointed to a path that no longer exists!

---

## 🔹 Task 5: Test Hard Link Behavior (Original Deleted)

```bash
# Try reading through the hard link
cat ~/cloudx/monitoring/nginx.conf
```

**Expected Output:**
```
user nginx;
```

> ✅ Hard link still works! The data on disk remains accessible because the inode still has one reference pointing to it.

---

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

---

## 🏢 Real-World DevOps Use Cases

```
# Soft links — multiple environments pointing to one config
/cloudx/dev-env/nginx.conf     ──► /cloudx/configs/nginx.conf
/cloudx/staging-env/nginx.conf ──► /cloudx/configs/nginx.conf
/cloudx/prod-env/nginx.conf    ──► /cloudx/configs/nginx.conf

# Hard links — stable backup copy
/cloudx/monitoring/nginx.conf  ══► (same inode as original)
```

Update the original once → all soft links see the change instantly! 🚀

---

## 💡 Key Learnings
- `ln -s` creates a soft/symbolic link — like a desktop shortcut
- `ln` (without `-s`) creates a hard link — a second name for the same data
- Soft links break when the original is deleted
- Hard links survive original file deletion — data stays until ALL hard links are removed
- Use `ls -li` to see inode numbers and verify hard links
- Soft links are preferred in DevOps for config management across environments
- Hard links are preferred for backups and tools needing guaranteed file access

---

## 🔧 Tools & Environment Used
- **KillerCoda** — Ubuntu 24.04 Playground
- **Mise Academy** DevOps Batch
