# 📅 Day 17 — Configuring User & Group Permissions for a Cloud Project
> **Course:** Mise Academy DevOps Batch  
> **Environment:** KillerCoda (Ubuntu 24.04)  
> **Scenario:** Cloud Systems Administrator setting up controlled access for a cloud project team

---

## 🎯 Objectives
- Create users and groups for a cloud project
- Set proper file ownership and permissions
- Secure sensitive files
- Follow best practices for access management (RBAC)

---

## 🔑 Linux Permission Structure

```
- rwx rwx rwx
  │   │   │
  │   │   └── Others  (r=4, w=2, x=1)
  │   └────── Group   (r=4, w=2, x=1)
  └────────── User    (r=4, w=2, x=1)

File Types:
  d = Directory
  - = Regular File
  l = Symbolic Link
```

### Permission Values
| Permission | Symbol | Value |
|-----------|--------|-------|
| Read | r | 4 |
| Write | w | 2 |
| Execute | x | 1 |
| No permission | - | 0 |

**Example:** `chmod 755` = User(7=rwx) Group(5=r-x) Others(5=r-x)

---

## 🛠️ Commands Practiced

### Step 1: Check Current User
```bash
whoami
# Output: root

id
# Output: uid=0(root) gid=0(root) groups=0(root)
```

---

### Step 2: Create a New Cloud User
```bash
sudo adduser clouduser
# Prompts for password, full name, room number, etc.

sudo passwd clouduser
# Prompts to set/update password
```

---

### Step 3: Give Sudo Access to clouduser
```bash
sudo usermod -aG sudo clouduser

# Verify
id clouduser
```

---

### Step 4: Check User in System
```bash
grep clouduser /etc/passwd
```
**Output:**
```
clouduser:x:1003:1003:jk,afsd,,aafds,adfs:/home/clouduser:/bin/bash
```

---

### Step 5: Create a Test File & Change Ownership
```bash
touch file.txt

# Change ownership
sudo chown clouduser:clouduser file.txt

# Verify
ls -l file.txt
# Output: -rw-r--r-- 1 clouduser clouduser 0 May 10 12:00 file.txt
```

---

### Step 6: Modify User Permissions
```bash
# Add read, write, execute for user
chmod u+rwx file.txt

# Remove write from user
chmod u-w file.txt

# Verify
ls -l file.txt
# Output: -r-xr--r-- 1 clouduser clouduser 0 May 10 12:00 file.txt
```

---

### Step 7: Create a Cloud Admin Group
```bash
sudo groupadd cloudadmin

# Create devuser
sudo adduser devuser

# Add devuser to cloudadmin group
sudo usermod -aG cloudadmin devuser

# Verify
groups devuser
```

---

### Step 8: Manage Group Permissions
```bash
# Change group ownership of file
sudo chown :cloudadmin file.txt

# Add read, write, execute for group
chmod g+rwx file.txt

# Remove write from group
chmod g-w file.txt

# Verify
ls -l file.txt
```

---

### Step 9: Search for the Group
```bash
grep -i cloudadmin /etc/group
```
**Output:**
```
cloudadmin:x:1002:devuser
```

---

### Step 10: Remove User from Group
```bash
sudo gpasswd -d clouduser cloudadmin
```
**Output:** `Removing user clouduser from group cloudadmin`

---

### Step 11: Delete User and Group
```bash
sudo userdel clouduser
sudo groupdel cloudadmin

# Verify deletion
grep -i cloudadmin /etc/group
# Output: (empty — group deleted)
```

---

### Step 12: Script and File Permission Example
```bash
touch script.sh
chmod 755 script.sh    # rwxr-xr-x — executable script
chmod 644 file.txt     # rw-r--r-- — readable config file

# Verify both
ls -l
```
**Output:**
```
-rw-r--r-- 1 root root 0 Jun 6 18:42 file.txt
-rwxr-xr-x 1 root root 0 Jun 6 18:49 script.sh
```

---

### Switch Users
```bash
su clouduser
# Switches to clouduser (prompts for password)
```

---

## 📌 Common chmod Values Reference

| chmod | Permissions | Use Case |
|-------|------------|----------|
| `777` | rwxrwxrwx | Full access (avoid in production!) |
| `755` | rwxr-xr-x | Scripts and executables |
| `644` | rw-r--r-- | Config and text files |
| `700` | rwx------ | Private scripts (owner only) |
| `600` | rw------- | Private files (owner only) |

---

## 💡 Key Learnings
- User lifecycle management: create, modify, delete (`adduser`, `usermod`, `userdel`)
- Group-based access control with `groupadd`, `gpasswd`, `groupdel`
- File ownership management with `chown`
- Symbolic chmod (`u+rwx`, `g-w`) vs numeric chmod (`755`, `644`)
- Principle of Least Privilege and Role-Based Access Control (RBAC)
- Real-world permission patterns for scripts vs config files

---

## 🔧 Tools Used
- **KillerCoda** — Ubuntu 24.04 Playground
- **Mise Academy** DevOps Batch
