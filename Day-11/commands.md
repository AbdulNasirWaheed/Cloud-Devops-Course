# Day-11: Commands Reference

Git & GitHub setup and version control basics on a local machine.

## Session Scope
- Git initialization and repository cloning
- Staging, committing, and pushing changes
- Creating and switching branches
- Basic GitHub remote workflow

## 🚀 Setup & Configuration

```bash
# Install Git (if needed)
sudo apt update && sudo apt install -y git

# Configure global identity
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Verify configuration
git config --list
```

## 📥 Cloning & Init

```bash
# Clone an existing repository
git clone https://github.com/username/repository.git

# Or initialize a new local repository
git init
```

## 📝 Staging & Committing

```bash
# Check repository status
git status

# Stage specific files
git add filename.txt

# Stage all changes
git add .

# Commit with a message
git commit -m "Initial commit"
```

## 🌿 Branching & Merging

```bash
# List branches
git branch

# Create a new branch
git branch feature-branch

# Switch to a branch
git checkout feature-branch
# Or create and switch in one step
git checkout -b feature-branch

# Merge branch into current branch
git merge feature-branch
```

## ☁️ Pushing to Remote

```bash
# Push current branch to remote
git push origin main

# Push a new branch to remote
git push -u origin feature-branch

# Pull latest changes from remote
git pull origin main
```
