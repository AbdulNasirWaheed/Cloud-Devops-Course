# 📅 Day 24 — Real-Time Linux Networking and Troubleshooting Commands
> **Course:** Mise Academy DevOps Batch  
> **Environment:** AWS EC2 (Ubuntu) via IAM User  
> **Scenario:** Junior DevOps Engineer at TechCloud Inc. investigating intermittent connectivity issues and slow response times on a production Ubuntu web server

---

## 🎯 Objectives
- Check IP addresses and test network connectivity
- List open ports and running services
- Test DNS resolution and routing paths
- Search system logs for errors
- Configure UFW firewall for server security

---

## 🔹 Task 1: Check IP and Connectivity

### List all network interfaces and IPs
```bash
ip a
```
**Output:**
```
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500
    inet 192.168.0.101/24 brd 192.168.0.255 scope global dynamic ens33
```
**Use case:** See all network interfaces and their assigned IP addresses.

---

### Test internet connectivity
```bash
ping google.com
```
**Output:**
```
PING google.com (142.250.190.14) 56(84) bytes of data.
64 bytes from lax02s29-in-f14.1e100.net: icmp_seq=1 ttl=115 time=18.5 ms
```
**Use case:** Verify the server can reach the internet. Uses ICMP protocol.  
Press `Ctrl+C` to stop.

---

### Get the server's public IP
```bash
curl ifconfig.me
```
**Output:** `203.0.113.45`  
**Use case:** Find out what public IP address the server is using.

---

## 🔹 Task 2: Check Open Ports and Services

### List all open ports (netstat)
```bash
netstat -tulnp
```
**Output:**
```
tcp  0  0  0.0.0.0:80   0.0.0.0:*  LISTEN  1234/nginx: master
tcp  0  0  0.0.0.0:22   0.0.0.0:*  LISTEN  567/sshd
```
**Use case:** See which services are listening on which ports.  
`-t` TCP, `-u` UDP, `-l` listening, `-n` numeric, `-p` process name

---

### Modern replacement for netstat
```bash
ss -tuln
```
**Output:**
```
LISTEN  0  128  *:22  *:*
LISTEN  0  128  *:80  *:*
```
**Use case:** Faster and more detailed than netstat. Preferred in modern Linux.

---

## 🔹 Task 3: DNS and Routing

### Download a file to test web connectivity
```bash
wget https://www.filesampleshub.com/download/document/txt/sample.txt
```
**Output:**
```
Saving to: 'sample.txt'
sample.txt  100%[===================>]  127  --.-KB/s  in 0s
```
**Use case:** Test if the server can download files from the internet.

---

### Trace the network path to a destination
```bash
traceroute google.com
```
**Output:**
```
1  192.168.0.1    1.123 ms
2  10.10.0.1      3.456 ms
3  142.250.190.14 25.678 ms
```
**Use case:** Diagnose where network slowness or failures occur along the route.  
Install if needed: `sudo apt install traceroute -y`

---

### Check network interfaces (older method)
```bash
ifconfig
```
**Output:**
```
ens33: flags=4163<UP,BROADCAST,RUNNING,MULTICAST> mtu 1500
       inet 192.168.0.101 netmask 255.255.255.0 broadcast 192.168.0.255
```
**Use case:** Alternative to `ip a` — older but still widely used.  
Install if needed: `sudo apt install net-tools -y`

---

### Check DNS resolution
```bash
nslookup google.com
```
**Output:**
```
Name:    google.com
Address: 142.250.190.14
```
**Use case:** Verify a domain name resolves to the correct IP address. Useful when a website is unreachable.

---

## 🔹 Task 4: Troubleshoot and Audit Logs

### Search for errors in system log
```bash
grep "error" /var/log/syslog
```
**Output:**
```
May 12 07:45:10 server1 nginx[1234]: [error] 500 Internal Server Error
```
**Use case:** Quickly find error messages in logs without reading the entire file.

---

### Find nginx config files
```bash
find /etc -name "nginx*"
```
**Output:**
```
/etc/nginx
/etc/nginx/nginx.conf
```
**Use case:** Locate configuration files for any service across the filesystem.

---

### View command history
```bash
history
```
**Output:**
```
101  ip a
102  ping google.com
103  grep "error" /var/log/syslog
```
**Use case:** Review what commands were previously run — useful for auditing.

---

### List all usernames on the system
```bash
cut -d':' -f1 /etc/passwd
```
**Output:**
```
root
daemon
syslog
ubuntu
```
**Use case:** Quick audit of all user accounts on the server.

---

## 🔹 Task 5: Configure UFW Firewall

> A firewall is like a **security guard** for your server — it decides what traffic is allowed in and what gets blocked.

### Install UFW (if not present)
```bash
sudo apt install ufw -y
```

### Enable the firewall
```bash
sudo ufw enable
```

### Allow SSH (port 22) — ALWAYS do this first or you'll lock yourself out!
```bash
sudo ufw allow ssh
```

### Allow HTTP (port 80)
```bash
sudo ufw allow http
```

### View firewall rules
```bash
sudo ufw status verbose
```
**Output:**
```
Status: active
To                   Action    From
--                   ------    ----
22                   ALLOW     Anywhere
80                   ALLOW     Anywhere
```

### Verify port 80 is open
```bash
sudo netstat -tuln | grep :80
```

---

## 📊 Networking Commands Reference

| Command | Purpose |
|---------|---------|
| `ip a` | List all network interfaces and IPs |
| `ping google.com` | Test internet connectivity |
| `curl ifconfig.me` | Get public IP address |
| `netstat -tulnp` | List open ports and processes |
| `ss -tuln` | Modern alternative to netstat |
| `wget <url>` | Download a file from the internet |
| `traceroute google.com` | Trace network path to destination |
| `ifconfig` | Show network interface config (legacy) |
| `nslookup google.com` | DNS lookup — domain to IP |
| `grep "error" /var/log/syslog` | Search logs for errors |
| `find /etc -name "nginx*"` | Locate config files |
| `history` | View previously run commands |
| `cut -d':' -f1 /etc/passwd` | List all system users |
| `sudo ufw enable` | Enable firewall |
| `sudo ufw allow ssh` | Allow SSH through firewall |
| `sudo ufw status verbose` | View firewall rules |

---

## 📊 Common Port Numbers to Know

| Port | Service | Purpose |
|------|---------|---------|
| 22 | SSH | Secure remote login |
| 80 | HTTP | Web traffic |
| 443 | HTTPS | Secure web traffic |
| 3306 | MySQL | Database |
| 5432 | PostgreSQL | Database |
| 8080 | HTTP Alt | App servers |

---

## 💡 Key Learnings
- `ip a` and `ifconfig` show network interfaces — `ip a` is the modern preferred command
- `ping` uses ICMP protocol to test connectivity — if it fails, network is down
- `curl ifconfig.me` reveals the server's public IP — important for security audits
- `netstat` and `ss` show which ports are open — critical for security checks
- `traceroute` shows each network hop — helps isolate where slowness occurs
- `nslookup` verifies DNS is working — first check when a domain is unreachable
- `grep` in logs is a DevOps superpower — find errors in seconds across huge log files
- **Always allow SSH before enabling UFW** — or you'll lose access to your server!
- `ufw` firewall is the first line of defense — only open ports you actually need

---

## 🔧 Tools & Environment Used
- **AWS EC2** — Ubuntu instance (accessed via IAM user)
- **AWS IAM** — EC2 full permissions assigned
- **UFW** — Uncomplicated Firewall
- **Mise Academy** DevOps Batch
