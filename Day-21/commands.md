# Day-21: Commands Reference

> **Note:** Commands below were extracted from the folder README and existing command reference files. The terminal screenshots in this folder could not be OCR-read because the current model does not support image input.

## Description
This session covers soft (symbolic) links vs. hard links, filesystem inodes, and applying links to real-world cloud configuration management.

## Commands by Topic

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
# Result: Broken link
```

### Task 5: Test Hard Link Behavior (Original Deleted)
```bash
cat ~/cloudx/monitoring/nginx.conf
# Result: Still works — same inode
```
