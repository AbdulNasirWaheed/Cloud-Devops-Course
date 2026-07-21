# Day-22: Commands Reference

> **Note:** Commands below were extracted from the folder README and existing command reference files. The terminal screenshots in this folder could not be OCR-read because the current model does not support image input.

## Description
This session covers system diagnostics, CPU/memory monitoring, resource stress testing, package management, and service control on an Ubuntu-based AWS EC2 instance.

## Commands by Topic

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
```bash
systemctl start nginx
systemctl stop nginx
systemctl restart apache2
systemctl reload nginx
systemctl enable apache2
systemctl disable apache2
systemctl status docker
systemctl list-units --type=service
```
