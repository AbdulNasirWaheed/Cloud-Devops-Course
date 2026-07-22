# Django Notes App — CI/CD Pipeline with Jenkins & AWS EC2

A full Declarative CI/CD pipeline that automates building, testing, and deploying a Django notes application using **Jenkins**, **GitHub**, and **AWS EC2** — with **Gunicorn** serving the app in production mode.

## 🏗️ Architecture

```
GitHub (push to main) → Jenkins (AWS EC2) → Build & Test → Gunicorn (0.0.0.0:8000)
```

## 🧰 Stack

| Tool | Purpose |
|---|---|
| AWS EC2 (Ubuntu) | Hosts Jenkins and the deployed app |
| Jenkins | CI/CD orchestration via Declarative Pipeline |
| GitHub | Source control, triggers builds on push |
| Python venv | Isolated dependency environment |
| Django | Web application framework |
| Gunicorn | Production WSGI server |
| Whitenoise | Static file serving |

## 📋 Prerequisites

- AWS EC2 instance (Ubuntu Server, t2.micro is fine for testing)
- Security Group inbound rules: **22** (SSH) and **8000** (app) open
- Jenkins installed on the EC2 instance with Git, Pipeline plugins
- Python 3, `python3-venv`, `pip` installed on the agent

## 🔧 Pipeline Stages

1. **Clone the Repo** — pulls the latest code from `main`
2. **Create Virtual Environment** — isolated Python env per build
3. **Install Dependencies** — installs `requirements.txt` (plus a `setuptools` pin, see below)
4. **Run Migrations** — `makemigrations` + `migrate`
5. **Collect Static Files** — `collectstatic` for Whitenoise
6. **Run Django App** — starts Gunicorn bound to `0.0.0.0:8000`, detached from the Jenkins build process

## 🐛 Problems Encountered & Fixes

This project surfaced a series of real-world CI/CD issues — documented here for reference in case you hit the same walls.

### 1. Groovy parsing errors from nested quotes
```groovy
sh 'bash -c 'python3 -m venv django''   // ❌ breaks Groovy string parsing
```
**Fix:** never nest `'...'` inside `'...'`. Use `sh 'python3 -m venv django'` directly, or double quotes on the outside if wrapping is needed.

### 2. Virtual environment "not activating"
Every `sh` step in Jenkins runs in a **new shell process** — activating a venv in one step has no effect on the next.

**Fix:** activate and run dependent commands inside the *same* `sh '''...'''` block:
```groovy
sh '''
    . django/bin/activate
    pip install -r requirements.txt
'''
```

### 3. `disown: not found`
Jenkins `sh` steps run under `dash`, not `bash` — and `disown` is a bash-only builtin.

**Fix:** removed `disown`; `nohup ... &` alone is sufficient to detach the process.

### 4. Jenkins kills backgrounded processes on build completion
Even with `nohup`, Jenkins tracks and terminates every process spawned during a build once it finishes.

**Fix:** override Jenkins' process-tracking environment variables:
```groovy
sh '''
    BUILD_ID=dontKillMe JENKINS_NODE_COOKIE=dontKillMe nohup gunicorn notesapp.wsgi:application --bind 0.0.0.0:8000 --workers 3 > server.log 2>&1 &
'''
```

### 5. SSH connection timeout / app unreachable externally
"Connection timed out" (not "refused") pointed to network-layer blocking, not application-layer issues.

**Fix:**
- Opened port `8000` in the **AWS Security Group** inbound rules (`0.0.0.0/0` for testing)
- Confirmed the instance's current public IP (can change on stop/start without an Elastic IP)
- Verified `ufw` wasn't also blocking the port at the OS level

### 6. `ModuleNotFoundError: No module named 'pkg_resources'`
Older `gunicorn==20.1.0` depends on `pkg_resources`, which newer `setuptools` versions no longer ship by default.

**Fix:** pin an older `setuptools` after installing requirements:
```groovy
sh '''
    pip install -r requirements.txt
    pip install "setuptools<81"
'''
```

### 7. Wrong WSGI module path
Assumed the Django project folder name instead of checking the actual `Procfile`.

**Fix:** always confirm against `Procfile`:
```
web: gunicorn notesapp.wsgi
```

### 8. Divergent Git branches
A commit made directly on the EC2 instance (adding the Jenkinsfile) diverged from a separate commit on GitHub (README update), both branching from the same parent commit.

**Fix:** merged safely without losing history:
```bash
git config pull.rebase false
git pull origin main
git push origin main
```

## ✅ Verifying the Deployment

```bash
# On the EC2 instance
sudo ss -tulnp | grep 8000

# From anywhere (after Security Group + app confirmed running)
curl http://<EC2_PUBLIC_IP>:8000
```

## 🙏 Acknowledgments

Learned through a hands-on DevOps exercise guided by **Miseacademy** and **Hafiz Muhammad Umair Munir**.

## 📄 License

For educational purposes.
