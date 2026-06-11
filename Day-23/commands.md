# 📅 Day 23 — Attaching and Configuring an EBS Volume in AWS EC2
> **Course:** Mise Academy DevOps Batch  
> **Environment:** AWS EC2 (Ubuntu) + AWS Console  
> **Scenario:** DevOps Engineer at a web application company mounting a new EBS volume at `/mnt/data` to store application log files that must persist across reboots

---

## 🎯 Objectives
- Create and attach a new EBS volume to an EC2 instance
- List, partition, and format the new disk
- Mount the volume and verify it
- Persist the mount using `/etc/fstab` so it survives reboots
- Fix ownership permissions on the mounted volume

---

## 🧠 Key Concepts

| Term | Real Life Analogy | Computer Meaning |
|------|------------------|-----------------|
| **EBS Volume** | A new external hard drive | Extra cloud storage attached to EC2 |
| **Partition** | Dividing a cupboard into sections | Dividing a hard drive into parts |
| **Format** | Lining and labeling a shelf | Preparing partition with a file system |
| **Mount** | Plugging in a USB drive | Making the disk accessible at a folder path |
| **fstab** | Auto-startup instructions | Config file that mounts disks on every reboot |
| **UUID** | Serial number on a hard drive | Unique ID for a disk partition |

---

## 🛠️ Step 1: Create and Attach EBS Volume (AWS Console)

```
EC2 → Elastic Block Store → Volumes → Create Volume
  Size:               5 GiB
  Volume Type:        gp2 (General Purpose SSD)
  Availability Zone:  Same as your EC2 instance (e.g., eu-north-1b)
  → Create Volume

Attach to EC2:
  Actions → Attach Volume
  Select instance
  Device name: /dev/xvdf
  → Attach
```

> ⚠️ **Important:** EC2 instance and EBS volume MUST be in the same Availability Zone!

---

## 🛠️ Step 2: List All Disks

```bash
lsblk
```

**Output (before partitioning):**
```
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   30G  0 disk /
└─xvda1 202:1    0   30G  0 part /
xvdf    202:80   0    5G  0 disk
```

> `xvdf` is your new unformatted 5GB disk — no mountpoint yet.

---

## 🛠️ Step 3: Partition the New Disk

```bash
sudo fdisk /dev/xvdf
```

**Steps inside fdisk (interactive):**
```
n   → new partition
p   → primary partition
1   → partition number 1
Enter → accept default first sector
Enter → accept default last sector
w   → write changes and exit
```

**Verify partition was created:**
```bash
lsblk
```

**Output (after partitioning):**
```
xvdf    202:80   0    5G  0 disk
└─xvdf1 202:81   0    5G  0 part
```

---

## 🛠️ Step 4: Format the New Partition

```bash
sudo mkfs.ext4 /dev/xvdf1
```

**Output:**
```
mke2fs 1.45.5 ...
Creating filesystem with 1310720 blocks ...
```

> This formats the partition with **ext4** — the standard Linux file system.

---

## 🛠️ Step 5: Create Mount Point & Mount the Disk

```bash
# Create the mount directory
sudo mkdir /mnt/data

# Mount the partition
sudo mount /dev/xvdf1 /mnt/data
```

---

## 🛠️ Step 6: Verify Mount

```bash
df -h
```

**Expected Output:**
```
Filesystem   Size  Used Avail Use% Mounted on
/dev/xvda1    30G    1G   29G   4% /
/dev/xvdf1   4.9G   24M  4.6G   1% /mnt/data
```

> `/mnt/data` is now available with 4.6GB free! ✅

---

## 🛠️ Step 7: Persist Mount Using /etc/fstab

Without fstab, the mount disappears after reboot. To make it permanent:

### Get the UUID of the partition
```bash
sudo blkid /dev/xvdf1
```

**Output:**
```
/dev/xvdf1: UUID="3f0d5ac2-2269-4e5e-800e-3dc9f5a21e25" TYPE="ext4"
```

### Edit fstab
```bash
sudo nano /etc/fstab
```

**Add this line at the bottom (use YOUR UUID):**
```
UUID=3f0d5ac2-2269-4e5e-800e-3dc9f5a21e25 /mnt/data ext4 defaults,nofail 0 2
```

> `nofail` means the server still boots even if this disk is missing — very important for EC2!

---

## 🛠️ Step 8: Test fstab Configuration

```bash
sudo mount -a
```

> If no errors appear → fstab is configured correctly ✅

---

## 🛠️ Step 9: Reboot & Verify Persistence

```bash
sudo reboot
```

**After reboot, verify the disk is still mounted:**
```bash
df -h | grep /mnt/data
```

**Expected Output:**
```
/dev/xvdf1   4.9G   24M  4.6G   1% /mnt/data
```

> Disk survived the reboot! ✅

---

## 🛠️ Step 10: Fix Permissions & Use the Volume

### Check current permissions
```bash
ls -ld /mnt/data
```

### Change ownership to ubuntu user
```bash
sudo chown -R ubuntu:ubuntu /mnt/data
```

### Now create folders and files without sudo
```bash
cd /mnt/data
mkdir my_projects
cd my_projects
nano notes.txt
```

> Now you're storing files on the **new disk**, not the system disk! 🎉

---

## 📊 EBS Volume Setup — Full Flow Summary

```
AWS Console          →  Create 5GB EBS Volume
                     →  Attach to EC2 as /dev/xvdf
                     
EC2 Terminal         →  lsblk          (see new disk)
                     →  fdisk          (partition it)
                     →  mkfs.ext4      (format it)
                     →  mkdir /mnt/data (create mount point)
                     →  mount          (attach disk to folder)
                     →  df -h          (verify mount)
                     →  blkid          (get UUID)
                     →  nano /etc/fstab (make permanent)
                     →  mount -a       (test fstab)
                     →  reboot + verify (confirm persistence)
```

---

## 💡 Key Learnings
- EBS volumes must be in the **same Availability Zone** as the EC2 instance
- `lsblk` shows all disks and partitions
- `fdisk` creates partitions on a raw disk
- `mkfs.ext4` formats a partition so Linux can use it
- `mount` connects a partition to a folder path
- `/etc/fstab` makes mounts **survive reboots** — critical in production!
- `blkid` gives the UUID — always use UUID in fstab, not device name (device names can change!)
- `nofail` in fstab prevents boot failure if the volume is detached
- Always fix ownership with `chown` so you don't need `sudo` for everyday operations

---

## 🔧 Tools & Environment Used
- **AWS EC2** — Ubuntu instance
- **AWS EBS** — Elastic Block Store (5GiB volume)
- **AWS Console** — Volume creation and attachment
- **Mise Academy** DevOps Batch
