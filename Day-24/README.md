# Day-24: Networking & Firewall Setup

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Troubleshoot network connectivity, inspect open ports, audit system logs, and configure UFW firewall rules on an Ubuntu AWS EC2 instance.

## 🏭 Industry Scenario
Junior DevOps Engineer at TechCloud Inc. investigating intermittent connectivity issues and slow response times on a production Ubuntu web server.

## ✅ What I Practiced

### Task 1: Check IP and Connectivity
```bash
ip a
ping google.com
curl ifconfig.me
```

### Task 2: Check Open Ports and Services
```bash
netstat -tulnp
ss -tuln
```

### Task 3: DNS and Routing
```bash
wget https://www.filesampleshub.com/download/document/txt/sample.txt
traceroute google.com
ifconfig
nslookup google.com
```

### Task 4: Troubleshoot and Audit Logs
```bash
grep "error" /var/log/syslog
find /etc -name "nginx*"
history
cut -d':' -f1 /etc/passwd
```

### Task 5: Configure UFW Firewall
```bash
sudo apt install ufw -y
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow http
sudo ufw status verbose
```

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
| `sudo ufw enable` | Enable firewall |
| `sudo ufw allow ssh` | Allow SSH through firewall |
| `sudo ufw status verbose` | View firewall rules |

## 📊 Common Port Numbers

| Port | Service | Purpose |
|------|---------|---------|
| 22 | SSH | Secure remote login |
| 80 | HTTP | Web traffic |
| 443 | HTTPS | Secure web traffic |
| 3306 | MySQL | Database |
| 5432 | PostgreSQL | Database |
| 8080 | HTTP Alt | App servers |

## 🗂️ Repository Contents
- `commands.md` — Full command reference
- `Untitled.png` through `Untitled5.png` — Networking and firewall configuration screenshots

## 💡 Key Learnings
- `ip a` and `ifconfig` show network interfaces — `ip a` is the modern preferred command
- `ping` uses ICMP protocol to test connectivity
- `netstat` and `ss` show which ports are open — critical for security checks
- `traceroute` shows each network hop — helps isolate where slowness occurs
- `nslookup` verifies DNS is working — first check when a domain is unreachable
- `grep` in logs is a DevOps superpower — find errors in seconds across huge log files
- **Always allow SSH before enabling UFW** — or you'll lose access to your server!

---

**Day 24 Complete** ✅

Network troubleshooting and firewall hardening for cloud servers.

#DevOps #AWS #Linux #Networking #UFW #Security #100DaysOfDevOps
