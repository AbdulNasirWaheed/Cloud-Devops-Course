# 📅 Day 22 — System Level Linux Commands in Real-World Scenario
> **Course:** Mise Academy DevOps Batch  
> **Environment:** KillerCoda (Ubuntu 24.04) / AWS EC2  
> **Scenario:** Cloud Operations Engineer performing system diagnostics, resource monitoring, package management, and service control on an Ubuntu-based AWS VM

---

## 🎯 Objectives
- Perform system diagnostics and monitoring
- Monitor processes and resource usage in real time
- Simulate CPU and memory stress and observe with vmstat
- Manage packages using apt and dpkg
- Control services using systemctl

---

## 🛠️ Part 1: System Diagnostics and Monitoring

### Task 1.1: Print System Information
```bash
uname -a
```
**Output:** `Linux web-server01 5.15.0-105-generic #115-Ubuntu SMP x86_64 GNU/Linux`  
**Use case:** Identify kernel version and architecture for troubleshooting.

---

### Task 1.2: Display Hostname
```bash
hostname
```
**Output:** `web-server01`  
**Use case:** Identify the server in a cluster or inventory.

---

### Task 1.3: Check System Uptime
```bash
uptime
```
**Output:** `12:30:45 up 5 days, 4:17, 3 users, load average: 0.25, 0.40, 0.36`  
**Use case:** Check for unexpected reboots or downtime.

---

### Task 1.4: Check Memory Usage
```bash
free -h
```
**Output:**
```
             total   used   free  shared  buff/cache  available
Mem:          3.8G   1.1G   500M    200M        2.2G       2.1G
Swap:           0B     0B     0B
```

---

### Task 1.5: Check Disk Space
```bash
df -h
```
**Output:**
```
Filesystem  Size  Used Avail Use% Mounted on
/dev/sda1    40G   15G   23G  40% /
```

---

## 📊 Part 2: Process and Resource Monitoring

### Task 2.1: Monitor Processes in Real Time
```bash
top
```
**Use case:** Interactive process viewer — observe CPU and memory usage live. Press `q` to quit.

---

### Task 2.2: Install and Use htop
```bash
sudo apt install htop -y
htop
```
**Use case:** Better visual representation of processes. Sort by memory or CPU.

---

### Task 2.3: Find a Specific Process
```bash
ps aux | grep ssh
```
**Output:** `root 1011 0.0 0.1 12964 5252 ? Ss 10:00 0:00 /usr/sbin/sshd`  
**Use case:** Find the PID of a running service.

---

### Task 2.4: Create a Dummy Process and Kill It
```bash
# Create background process
sleep 1000 &

# Check its PID
ps aux | grep sleep

# Kill it (replace 1011 with actual PID)
kill -9 1011
```
**Use case:** Safely terminate rogue or non-critical processes.

---

### Task 2.5: View Memory Performance with vmstat
```bash
vmstat
```
**Output:**
```
procs ----memory---- ---swap-- ---io---- -system-- ----cpu-----
 r  b  swpd  free  buff  cache  si  so  bi  bo  in  cs  us sy id wa
 1  0     0 524288 10240 204800   0   0   0   1  10  20   5  2 93  0
```

### vmstat with intervals
```bash
# 5 samples at 1-second intervals
vmstat 1 5

# Real-time dashboard
watch -n 1 vmstat 1 1
```

---

### Task 2.6: Simulate High CPU Usage
```bash
# Terminal 1 — Spawn 4 CPU-intensive processes
yes > /dev/null &
yes > /dev/null &
yes > /dev/null &
yes > /dev/null &

# Terminal 2 — Monitor with vmstat
vmstat 1 10
```

**Sample output under CPU stress:**
```
 r  b  swpd    free   buff   cache  si  so  bi  bo   in   cs  us sy id wa
 4  0     0  204800  10000  200000   0   0   0   0  200  400  99  0  1  0
 4  0     0  204000  10000  200500   0   0   0   0  210  420  98  1  1  0
```

| Field | Meaning |
|-------|---------|
| `r=4` | 4 processes waiting for CPU |
| `us=99` | 99% CPU used by user processes |
| `id=1` | Almost no idle time |

### Stop CPU load
```bash
killall yes
```

---

### Task 2.7: Simulate High Memory Usage
```bash
# Allocate ~500MB
python3 -c "a = ['X' * 1024 * 1024] * 500" &

# Monitor
vmstat 1 10
free -h
```

---

## 📦 Part 3: Package Management

### Task 3.1: Update Package Index
```bash
sudo apt update
```

### Task 3.2: Install NGINX
```bash
sudo apt install nginx -y

# Test it's running
curl localhost
```

### Task 3.3: Remove NGINX
```bash
sudo apt remove nginx
```

### Task 3.4: List All Installed Packages
```bash
dpkg -l
```
**Use case:** Inventory management and security auditing.

---

## 🔧 Part 4: Service Management (systemctl)

### Task 4.1: Start a Service
```bash
sudo systemctl start nginx
```

### Task 4.2: Stop a Service
```bash
sudo systemctl stop nginx
```

### Task 4.3: Restart a Service
```bash
sudo systemctl restart apache2
```

### Task 4.4: Reload a Service (without full restart)
```bash
sudo systemctl reload nginx
```

### Task 4.5: Enable Service on Boot
```bash
sudo systemctl enable apache2
```

### Task 4.6: Disable Service on Boot
```bash
sudo systemctl disable apache2
```

### Task 4.7: Check Service Status
```bash
sudo systemctl status docker
```
**Output:**
```
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled)
     Active: active (running) since ...
```

### Task 4.8: List All Active Services
```bash
systemctl list-units --type=service
```

---

## 📊 systemctl Commands Reference

| Command | Action |
|---------|--------|
| `systemctl start nginx` | Start service |
| `systemctl stop nginx` | Stop service |
| `systemctl restart nginx` | Restart service |
| `systemctl reload nginx` | Reload config without restart |
| `systemctl enable nginx` | Auto-start on boot |
| `systemctl disable nginx` | Don't auto-start on boot |
| `systemctl status nginx` | Check current status |
| `systemctl list-units --type=service` | List all active services |

---

## 💡 Key Learnings
- `uname`, `hostname`, `uptime`, `free`, `df` = quick system health check
- `top` and `htop` = real-time process monitoring
- `ps aux | grep` = find any running process instantly
- `kill -9 PID` = force terminate a process
- `vmstat` = deep CPU, memory, and I/O performance insights
- `yes > /dev/null` = safe way to simulate CPU stress for testing
- `apt` = install/remove/update packages on Ubuntu/Debian systems
- `systemctl` = full lifecycle control of Linux services
- Always `systemctl enable` critical services so they survive reboots!

---

## 🔧 Tools & Environment Used
- **KillerCoda** — Ubuntu 24.04 Playground
- **AWS EC2** — Ubuntu VM
- **Mise Academy** DevOps Batch
