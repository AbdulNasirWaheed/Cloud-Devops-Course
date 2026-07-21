# Day-23: AWS EBS Volume Configuration

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Attach, format, mount, and persist an AWS EBS volume on an EC2 instance so that application data survives instance reboots.

## 🏭 Industry Scenario
A DevOps Engineer at a web application company needs to mount a new EBS volume at `/mnt/data` to store application log files that must persist across reboots — a critical requirement for database and logging workloads.

## ✅ What I Practiced
- Creating and attaching an EBS volume via AWS Console
- Partitioning a raw disk with `fdisk`
- Formatting partitions with `mkfs.ext4`
- Mounting volumes and verifying with `df -h`
- Persisting mounts in `/etc/fstab` using UUID
- Fixing ownership permissions on mounted volumes

## 🗂️ Repository Contents
- `commands.md` — Full step-by-step command reference
- `Untitled.png` through `Untitled5.png` — Screenshots of the EBS workflow

## 🗂️ EBS Setup Workflow

```
AWS Console → Create 5GB gp2 EBS Volume in same AZ as EC2
           ↓ Attach as /dev/xvdf
EC2 Terminal → lsblk (verify disk)
           ↓
           fdisk /dev/xvdf (partition)
           ↓
           mkfs.ext4 /dev/xvdf1 (format)
           ↓
           mkdir /mnt/data && mount /dev/xvdf1 /mnt/data
           ↓
           blkid (get UUID)
           ↓
           nano /etc/fstab (persist mount)
           ↓
           mount -a (test) + reboot (verify)
```

## 💡 Key Takeaways
- EBS volumes must be in the **same Availability Zone** as the EC2 instance
- Always use UUID (not device name) in `/etc/fstab`
- `nofail` prevents boot failure if the volume is detached
- `chown` fixes ownership so normal users can write to the mount

---

**Day 23 Complete** ✅

Persistent cloud storage configured for production workloads.

#DevOps #AWS #EBS #EC2 #Storage #100DaysOfDevOps
