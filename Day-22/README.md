# Day-22: Diagnostics & Process Monitoring

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Perform system diagnostics, monitor CPU/memory usage, simulate resource stress, manage packages, and control services on an Ubuntu-based AWS EC2 instance.

## 🏭 Industry Scenario
Cloud Operations Engineer performing system diagnostics, resource monitoring, package management, and service control on an Ubuntu-based AWS VM responding to performance alerts and maintaining server health.

## ✅ What I Practiced

### Part 1: System Diagnostics
```bash
uname -a
hostname
uptime
free -h
df -h
```

### Part 2: Process and Resource Monitoring
```bash
top
htop
ps aux | grep ssh
sleep 1000 &
kill -9 PID
vmstat
vmstat 1 5
```

### CPU Stress Test
```bash
yes > /dev/null &
yes > /dev/null &
yes > /dev/null &
yes > /dev/null &
vmstat 1 10
killall yes
```

### Memory Stress Test
```bash
python3 -c "a = ['X' * 1024 * 1024] * 500" &
vmstat 1 10
free -h
```

### Part 3: Package Management
```bash
sudo apt update
sudo apt install nginx -y
sudo apt remove nginx
dpkg -l
```

### Part 4: Service Management (systemctl)

| Command | Action |
|---------|--------|
| `systemctl start nginx` | Start service |
| `systemctl stop nginx` | Stop service |
| `systemctl restart apache2` | Restart service |
| `systemctl reload nginx` | Reload config without restart |
| `systemctl enable apache2` | Auto-start on boot |
| `systemctl disable apache2` | Don't auto-start on boot |
| `systemctl status docker` | Check current status |
| `systemctl list-units --type=service` | List all active services |

## 🗂️ Repository Contents
- `commands.md` — Full command reference
- `Untitled.png` through `Untitled12.png` — System diagnostics, htop, vmstat, and systemctl screenshots

## 💡 Key Learnings
- `uname`, `hostname`, `uptime`, `free`, `df` = quick system health check
- `top` and `htop` = real-time process monitoring
- `ps aux | grep` = find any running process instantly
- `kill -9 PID` = force terminate a process
- `vmstat` = deep CPU, memory, and I/O performance insights
- `yes > /dev/null` = safe way to simulate CPU stress for testing
- Always `systemctl enable` critical services so they survive reboots!

---

**Day 22 Complete** ✅

System diagnostics and process monitoring for production cloud operations.

#DevOps #AWS #Linux #Monitoring #SystemAdmin #100DaysOfDevOps
