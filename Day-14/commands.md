# Day-14: Commands Reference

EC2 instance management, Linux navigation, and filesystem exploration.

## Session Scope
- Navigating filesystem on a remote EC2 instance
- Understanding Linux directory structure
- Essential navigation commands: `pwd`, `ls`, `cd`, `mkdir`
- Basic file and directory operations on Ubuntu

## 📁 Filesystem Navigation

```bash
# Print working directory
pwd

# List files
ls
ls -la

# Change directory
cd /
cd home
cd ~
cd ..
```

## 📂 Directory Operations

```bash
# Create directories
mkdir devops
mkdir -p cloud/projects/terraform

# Navigate and verify
cd cloud/projects/terraform
pwd
ls -la
```
