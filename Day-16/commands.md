# Day-16: Commands Reference

Advanced Linux navigation, recursive file operations, and pattern matching on EC2.

## Session Scope
- Recursive directory operations (`cp -r`, `rm -r`)
- Wildcards and pattern matching in commands
- File viewing, searching, and filtering basics
- Directory structure best practices for cloud projects

## 🔁 Recursive Operations

```bash
# Recursive copy
cp -r project/ project-backup/

# Recursive list
ls -R

# Remove directory tree
rm -r temp/
rm -rf old-project/

# Recursive move
mv -r archive/ backups/archive/
```

## 🔍 Wildcards & Pattern Matching

```bash
# List all .log files
ls *.log

# List all files starting with 'app'
ls app*

# Remove all .tmp files
rm *.tmp

# Copy all .sh files to scripts/
cp *.sh scripts/
```

## 🔎 Searching & Filtering

```bash
# Search for text in files
grep "password" config.yaml

# Case-insensitive search
grep -i "error" logs/app.log

# Recursive search in directory
grep -r "TODO" src/
```
