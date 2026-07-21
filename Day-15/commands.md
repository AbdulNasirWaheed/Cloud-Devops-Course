# Day-15: Commands Reference

Linux file management and EC2 navigation fundamentals.

## Session Scope
- Creating and inspecting files and directories
- Copying and moving files
- Removing files and directories
- Listing and viewing file contents
- Managing project structure on EC2

## 📄 File Creation

```bash
# Create empty file
touch notes.txt
touch deploy.sh

# Create directory
mkdir scripts
mkdir -p app/src/config
```

## 📋 Viewing & Inspection

```bash
# List all files with details
ls -la

# View file contents
cat notes.txt

# Paginated view (press 'q' to exit)
less notes.txt

# View first 10 lines
head notes.txt

# View last 10 lines
tail notes.txt
```

## 📦 Copying & Moving

```bash
# Copy files
cp notes.txt backup.txt
cp -r src/ src-backup/

# Move/rename files
mv notes.txt document.txt
mv app/ ~/projects/app
```

## 🗑️ Removing Files & Directories

```bash
# Remove file
rm document.txt

# Remove empty directory
rmdir scripts

# Remove directory and contents
rm -rf src-backup/
```
