# Day 11 — Upload Files/Code on GitHub

> Part of the Cloud & DevOps Course | No IT Experience Required

---

## What is Git vs GitHub?

| Tool | Description |
|------|-------------|
| **Git** | A local tool on your computer that tracks changes in your files and non-empty folders |
| **GitHub** | An online platform where you store your Git projects, share them, and collaborate with others |

> GitHub provides **cloud hosting** for Git repositories.

---

## Setting Up Git (One Time Only)

**Step 1** — Install Git on your computer (free download from [https://git-scm.com](https://git-scm.com))

**Step 2** — Set your name and email so commits are labeled with your info:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

**Step 3** — Create a free account on [https://github.com](https://github.com)

> It's like setting up a user profile before you can save and share work online.

---

## How to Push Your Code to GitHub

### Part 1 — Initialize & Commit Locally

```bash
# 1. Initialize Git tracking in your project folder
git init

# 2. Check current status of your files
git status

# 3. Add all files to the staging area
git add .

# 4. Commit your changes with a message
git commit -m "Initial commit"
```

### Part 2 — Connect & Push to GitHub

> First, create a **new empty repository** on GitHub (no README, no .gitignore).

```bash
# 3. Connect your local repo to the GitHub repository
git remote add origin https://github.com/username/repo-name.git

# 4. Push your code to GitHub
git push -u origin main
```

> 👉 This uploads your local `main` branch to the remote origin (GitHub).
>
> ⚠️ If your default branch is called `master`, replace `main` with `master`.

---

## Clone a Remote Repository

Makes a local copy of a remote repository:

```bash
git clone https://github.com/username/repo-name.git
```

> A **repository** is a folder/project tracked by Git — locally or on GitHub.

---

## Full Push Workflow (Quick Reference)

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/username/repo-name.git
git push -u origin main
# Enter your GitHub email and password when prompted
```

---

## Branching Strategy

| Branch Name | Purpose |
|-------------|---------|
| `main` / `master` | Stable, production-ready code |
| `dev` / `develop` | Where active development happens |
| `feature/...` | Working on a new feature (e.g., `feature/login-page`) |
| `bugfix/...` | Fixing a specific bug (e.g., `bugfix/signup-error`) |
| `hotfix/...` | Urgent fixes directly on production |
| `release/...` | Prepares the next software release |

> **Merge requests (Pull Requests):** Propose adding your changes back into `main` or `dev` after team review.

---

## Branch & Pull Request (PR) Workflow

```bash
# 1. Create a new feature branch
git checkout -b feature/new-banner

# 2. Make your code changes, then stage and commit
git add .
git commit -m "Add new banner component"

# 3. Push the branch to GitHub
git push origin feature/new-banner
```

Then on GitHub:

1. Open a **Pull Request (PR)** comparing your branch with `main` or `dev`
2. Write a clear PR description
3. Team lead reviews and adds comments
4. Apply feedback → push updates
5. Team lead approves → **Merge** into `main`
6. *(Optional)* Delete the feature branch

---

## Key Terms

| Term | Definition |
|------|------------|
| `git init` | Initializes Git tracking in a local folder |
| `git status` | Shows current state of tracked/untracked files |
| `git add .` | Stages all changes for the next commit |
| `git commit` | Saves a snapshot of staged changes with a message |
| `git remote` | Links your local repo to a remote (GitHub) repo |
| `git push` | Uploads local commits to GitHub |
| `git clone` | Downloads a remote repo to your local machine |
| Repository | A folder/project tracked by Git |
| Branch | An independent line of development |
| Pull Request | A request to merge your branch into another branch |
