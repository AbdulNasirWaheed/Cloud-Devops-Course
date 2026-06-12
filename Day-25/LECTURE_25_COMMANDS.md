# Lecture 25: Linux File & Log Management in Production
## Complete Command Reference Guide

---

## TABLE OF CONTENTS
1. [Prerequisites](#prerequisites)
2. [Part 1: File Management](#part-1-file-management)
3. [Part 2: Log Management](#part-2-log-management)
4. [Command Cheat Sheet](#command-cheat-sheet)
5. [Troubleshooting & Tips](#troubleshooting--tips)

---

## Prerequisites

### Setup Requirements
- **Running EC2 instance (Ubuntu)**
- **IAM user with EC2 full permissions**
- **Access EC2 via IAM user**

---

## PART 1: FILE MANAGEMENT

### Step 1: Create Client Directories

```bash
sudo mkdir -p /opt/clients/client_alpha/{data,reports}
sudo mkdir -p /opt/clients/client_beta/{data,reports}
sudo mkdir -p /opt/clients/client_gamma/{data,reports}
```

**What it does:**
- `mkdir -p`: Creates directories with parent directories if needed
- `{data,reports}`: Creates both subdirectories in each client folder
- `sudo`: Requires root/admin privileges

**Expected Output:**
```
(no output means success)
```

---

### Step 2: Create User Groups

```bash
sudo groupadd client_alpha
sudo groupadd client_beta
sudo groupadd client_gamma
```

**What it does:**
- Creates user groups to manage access for multiple users
- Groups allow permission-based access without individual file assignment

**Verify:**
```bash
cat /etc/group | grep client
```

---

### Step 3: Set Ownership & Permissions

```bash
sudo chown -R root:client_alpha /opt/clients/client_alpha
sudo chmod -R 770 /opt/clients/client_alpha

sudo chown -R root:client_beta /opt/clients/client_beta
sudo chmod -R 770 /opt/clients/client_beta

sudo chown -R root:client_gamma /opt/clients/client_gamma
sudo chmod -R 770 /opt/clients/client_gamma
```

**Command Breakdown:**
- `chown`: Change ownership (user:group)
- `chmod 770`: 
  - **Owner (7)**: read, write, execute
  - **Group (7)**: read, write, execute
  - **Others (0)**: no permissions
- `-R`: Recursive (apply to all files/directories inside)

**Verify with:**
```bash
ls -ld /opt/clients/client_alpha
```

**Expected Output:**
```
drwxrwx--- 3 root client_alpha 4096 May 12 10:01 /opt/clients/client_alpha
```

**Permission Explanation:**
```
drwxrwx---
│││││││││
││││││└─ Others: ---  (no permissions)
│││││└── Group: rwx  (read, write, execute)
││││└─── Owner: rwx  (read, write, execute)
│└────── Directory: d
```

---

### Step 4: Create Dummy Files in data/

**Method 1: Using echo and tee (Recommended for sudo)**
```bash
echo "user_id,score" | sudo tee /opt/clients/client_alpha/data/data1.csv > /dev/null
echo "1,98" | sudo tee -a /opt/clients/client_alpha/data/data1.csv > /dev/null
```

**Method 2: Create empty files**
```bash
sudo touch /opt/clients/client_alpha/data/data2.csv
sudo touch /opt/clients/client_alpha/data/data3.csv
```

**Fix: Allow Directory Traversal**
```bash
sudo chmod +x /opt
sudo chmod +x /opt/clients
sudo chmod +x /opt/clients/client_alpha
```

**Note:** `+x` on a directory means users can `cd` into it or access files inside.

**Verify Content:**
```bash
cat /opt/clients/client_alpha/data/data1.csv
```

**Expected Output:**
```
user_id,score
1,98
```

---

### Step 5: Archive All reports/ Folders

```bash
sudo tar -czvf client_reports_backup.tar.gz -C /opt/clients \
  client_alpha/reports \
  client_beta/reports \
  client_gamma/reports
```

**Command Breakdown:**
- `tar`: Tape archive utility
- `-c`: Create archive
- `-z`: Compress with gzip
- `-v`: Verbose (show files being archived)
- `-f`: Specify filename
- `-C`: Change directory before archiving

**Expected Output:**
```
client_alpha/reports/
client_beta/reports/
client_gamma/reports/
```

---

### Step 6: Move and Set Permissions

```bash
sudo mv client_reports_backup.tar.gz /opt/backups/
sudo chmod 444 /opt/backups/client_reports_backup.tar.gz
```

**Final Check:**
```bash
ls -l /opt/backups/client_reports_backup.tar.gz
```

**Expected Output:**
```
-r--r--r-- 1 root root 10240 May 12 10:10 /opt/backups/client_reports_backup.tar.gz
```

**Permission Explanation:**
```
-r--r--r--
 │││││││││
 ││││││└─ Others: r--  (read only)
 │││││└── Group: r--   (read only)
 ││││└─── Owner: r--   (read only)
 └─────── File: -
```

---

## PART 2: LOG MANAGEMENT

### Understanding logrotate

**What is logrotate?**
- Manages log files to prevent disk space issues
- Rotates logs (renames and starts new ones)
- Compresses old logs to save space
- Deletes very old logs
- Runs commands after rotation (like service restart)

---

### Step 1: Navigate to Log Directory

```bash
cd /var/log
```

**View available logs:**
```bash
ls -la | head -20
```

---

### Step 2: View System Log (Ubuntu)

```bash
sudo tail -n 10 /var/log/syslog
```

**Command Breakdown:**
- `tail`: View last lines of a file
- `-n 10`: Show last 10 lines
- `sudo`: Required for system logs (elevated permissions)

**Example Output:**
```
May 12 10:12:01 ubuntu CRON[2101]: (root) CMD (test -x /etc/init.d/anacron)
May 12 10:12:01 ubuntu systemd[1]: Starting Clean php session files...
```

---

### Step 3: Create Working Directory

```bash
mkdir -p /opt/log_reports
cd /opt/log_reports
```

---

### Step 4: Create auth.log with Sample Data

**Open nano editor:**
```bash
nano auth.log
```

**Paste this content:**
```
May 25 10:00:01 server sshd[1234]: Accepted password for alice from 192.168.0.2 port 54321 ssh2
May 25 10:00:02 server sshd[1234]: pam_unix(sshd:session): session opened for user alice by (uid=0)
May 25 10:05:17 server sshd[1235]: Failed password for root from 192.168.0.3 port 54322 ssh2
May 25 10:07:45 server sshd[1236]: Accepted password for bob from 192.168.0.4 port 54323 ssh2
May 25 10:07:46 server sshd[1236]: pam_unix(sshd:session): session opened for user bob by (uid=0)
May 25 10:10:55 server sshd[1237]: Accepted password for charlie from 192.168.0.5 port 54324 ssh2
May 25 10:10:56 server sshd[1237]: pam_unix(sshd:session): session opened for user charlie by (uid=0)
```

**Save and exit:**
- Press: `CTRL+O` (save)
- Press: `ENTER` (confirm filename)
- Press: `CTRL+X` (exit)

---

### Step 5: Filter SSH Logs

```bash
grep "sshd" /var/log/auth.log > /opt/log_reports/ssh_access.log
```

**Command Breakdown:**
- `grep`: Search for pattern in file
- `"sshd"`: Pattern to search for
- `>`: Redirect output to file (overwrites)

**View filtered logs:**
```bash
cat /opt/log_reports/ssh_access.log
```

**Example Output:**
```
May 12 10:15:32 ubuntu sshd[2154]: Accepted password for testuser from 192.168.1.15 port 53782 ssh2
May 12 10:15:33 ubuntu sshd[2154]: pam_unix(sshd:session): session opened for user testuser by (uid=0)
```

---

### Step 6: Extract Timestamp and Username

```bash
awk '/sshd.*Accepted/ {print $1, $2, $3, $9}' \
  /opt/log_reports/ssh_access.log > /opt/log_reports/summary.log
```

**Command Breakdown:**
- `awk`: Text processing utility
- `/sshd.*Accepted/`: Pattern to match (contains both "sshd" and "Accepted")
- `{print $1, $2, $3, $9}`: Print fields 1, 2, 3, and 9
  - `$1`: Month (May)
  - `$2`: Day (12)
  - `$3`: Time (10:15:32)
  - `$9`: Username (testuser)

**View summary:**
```bash
cat /opt/log_reports/summary.log
```

**Expected Output:**
```
May 12 10:15:32 testuser
```

---

### Step 7: Archive Logs

```bash
tar -czvf /opt/log_reports/log_archive.tar.gz -C /opt/log_reports \
  ssh_access.log \
  summary.log
```

**Verify archive:**
```bash
ls -lh /opt/log_reports/log_archive.tar.gz
```

**List contents of archive:**
```bash
tar -tzf /opt/log_reports/log_archive.tar.gz
```

---

### Step 8: Configure Log Rotation

**Create logrotate config file:**
```bash
sudo nano /etc/logrotate.d/ssh_access
```

**Paste this configuration:**
```
/opt/log_reports/ssh_access.log {
    size 10k
    daily
    rotate 4
    compress
    missingok
    notifempty
}
```

**Configuration Breakdown:**
- `size 10k`: Rotate when file reaches 10 KB
- `daily`: Check rotation daily
- `rotate 4`: Keep 4 backup versions
- `compress`: Compress rotated logs
- `missingok`: Don't error if log missing
- `notifempty`: Don't rotate empty logs

**Save and exit:** `CTRL+O`, `ENTER`, `CTRL+X`

---

### Step 9: Simulate Log Rotation

```bash
sudo logrotate -f /etc/logrotate.d/ssh_access
```

**Command Breakdown:**
- `sudo`: Run as administrator
- `logrotate`: Run the logrotate tool
- `-f`: Force rotation (don't wait for schedule)
- `/etc/logrotate.d/ssh_access`: Use this configuration file

**Verify rotation:**
```bash
ls -l /opt/log_reports/
```

**Expected Output:**
```
ssh_access.log.1.gz  (compressed backup)
ssh_access.log       (current log)
```

---

## COMMAND CHEAT SHEET

### File & Directory Management
| Command | Purpose |
|---------|---------|
| `mkdir -p /path/dir` | Create directory with parents |
| `chown user:group file` | Change ownership |
| `chmod 770 file` | Change permissions (rwxrwx---) |
| `chmod +x dir` | Add execute permission to directory |
| `tar -czvf archive.tar.gz files` | Create compressed archive |
| `tar -xzvf archive.tar.gz` | Extract compressed archive |
| `ls -ld /path` | List directory details (not contents) |
| `ls -lh` | List with human-readable sizes |

### Log Filtering & Analysis
| Command | Purpose |
|---------|---------|
| `grep "pattern" file` | Search for pattern in file |
| `grep -v "pattern" file` | Show lines NOT matching pattern |
| `awk '{print $1}' file` | Print first column |
| `tail -n 10 file` | Show last 10 lines |
| `head -n 10 file` | Show first 10 lines |
| `wc -l file` | Count lines in file |
| `sed 's/old/new/g' file` | Replace text (global) |

### Log Rotation & Management
| Command | Purpose |
| --- | --- |
| `sudo logrotate -f config` | Force log rotation |
| `sudo logrotate -d config` | Dry-run (test without rotating) |
| `tail -f logfile` | Follow log in real-time |
| `journalctl -u service` | View systemd service logs |

---

## TROUBLESHOOTING & TIPS

### Permission Issues

**Problem: Permission denied when accessing files**
```bash
# Solution: Add execute permission to parent directories
sudo chmod +x /opt
sudo chmod +x /opt/clients
```

**Problem: Cannot append to file with echo**
```bash
# Wrong:
echo "text" >> /opt/clients/file.txt

# Right (use tee with -a for append):
echo "text" | sudo tee -a /opt/clients/file.txt > /dev/null
```

### Viewing Logs

**Real-time log monitoring:**
```bash
tail -f /var/log/syslog
```
*Press `CTRL+C` to stop*

**Search logs with context:**
```bash
grep -B 2 -A 2 "pattern" logfile
```
- `-B 2`: Show 2 lines before match
- `-A 2`: Show 2 lines after match

### Archiving Tips

**Exclude files from archive:**
```bash
tar --exclude='*.log' -czvf archive.tar.gz /source/
```

**See what's in archive before extracting:**
```bash
tar -tzf archive.tar.gz | head -20
```

### Log Rotation Simulation

**Test logrotate without actually rotating:**
```bash
sudo logrotate -d /etc/logrotate.d/ssh_access
```

**Force immediate rotation (useful for testing):**
```bash
sudo logrotate -f /etc/logrotate.d/ssh_access
```

---

## REAL-WORLD SCENARIOS

### Scenario 1: Security Incident Response
**Situation:** Detect brute-force SSH attacks
```bash
# Count failed login attempts
grep "Failed password" /var/log/auth.log | wc -l

# See unique IPs attempting attacks
grep "Failed password" /var/log/auth.log | awk '{print $11}' | sort | uniq -c

# Create incident report
grep "Failed password" /var/log/auth.log > incident_report_$(date +%Y%m%d).log
```

### Scenario 2: Customer Data Backup
**Situation:** Backup specific client data
```bash
# Create timestamped backup
tar -czvf client_alpha_backup_$(date +%Y%m%d_%H%M%S).tar.gz \
  -C /opt/clients client_alpha/data

# Verify backup integrity
tar -tzf client_alpha_backup_*.tar.gz
```

### Scenario 3: Log Management
**Situation:** Archive old logs and clean up disk space
```bash
# Archive logs older than 30 days
find /opt/log_reports -name "*.log" -mtime +30 -exec tar -czf {} \;

# Remove original after archiving
find /opt/log_reports -name "*.log" -mtime +30 -delete
```

---

## KEY TAKEAWAYS

✅ **File Management:**
- Use groups for multi-user access control
- Implement minimal permissions (principle of least privilege)
- Always backup before major changes
- Archive sensitive data with read-only permissions

✅ **Log Management:**
- Monitor logs in real-time for issues
- Filter logs effectively using grep and awk
- Automate log rotation to prevent disk space issues
- Archive logs for compliance and troubleshooting

✅ **Production Best Practices:**
- Test all commands in non-production first
- Always keep backups of critical data
- Document your procedures and commands
- Use timestamps in backups for easy identification
- Monitor logs regularly for security issues

---

## ADDITIONAL RESOURCES

- **man pages:** `man chmod`, `man tar`, `man logrotate`, `man awk`, `man grep`
- **Linux log locations:**
  - `/var/log/syslog` - System logs
  - `/var/log/auth.log` - Authentication logs
  - `/var/log/kernel.log` - Kernel messages
- **Key files:**
  - `/etc/logrotate.conf` - Main logrotate configuration
  - `/etc/logrotate.d/` - Custom logrotate rules

---

**Created for Lecture 25: Linux File & Log Management in Production**
**Course: Cloud Support Engineering & DevOps**
**By: MiseAcademy**
