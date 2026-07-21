# Day-23: Commands Reference

> **Note:** Commands below were extracted from the folder README and existing command reference files. The terminal screenshots in this folder could not be OCR-read because the current model does not support image input.

## Description
This session covers attaching, formatting, mounting, and persisting an AWS EBS volume on an EC2 instance so that application data survives instance reboots.

## Commands by Topic

### Partition and Format the Volume
```bash
lsblk
sudo fdisk /dev/xvdf
sudo mkfs.ext4 /dev/xvdf1
```

### Mount the Volume
```bash
sudo mkdir -p /mnt/data
sudo mount /dev/xvdf1 /mnt/data
df -h
```

### Persist the Mount in /etc/fstab
```bash
sudo blkid
sudo nano /etc/fstab
```

Example fstab entry:
```text
UUID=xxxx-xxxx-xxxx-xxxx   /mnt/data   ext4   defaults,nofail   0   2
```

### Fix Ownership Permissions
```bash
sudo chown -R ubuntu:ubuntu /mnt/data
```

### Verify
```bash
mount -a
sudo reboot
```
