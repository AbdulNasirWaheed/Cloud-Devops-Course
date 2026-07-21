# Day-25: Log Management in Production

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Configure Linux file ownership and permissions, filter and analyze logs with `grep`/`awk`, create compressed archives, and set up `logrotate` for automatic log rotation in a production environment.

## 🏭 Industry Scenario
Managing multi-client production logs on an Ubuntu EC2 instance. As a Cloud Engineer, you must secure client data directories, extract meaningful insights from system logs, and prevent disks from filling up due to uncontrolled log growth.

## ✅ What I Practiced

### Part 1: File Management
```bash
mkdir -p /opt/clients/client_alpha/{data,reports}
groupadd client_alpha
sudo chown -R root:client_alpha /opt/clients/client_alpha
sudo chmod -R 770 /opt/clients/client_alpha

sudo tar -czvf client_reports_backup.tar.gz -C /opt/clients \
  client_alpha/reports client_beta/reports client_gamma/reports

sudo mv client_reports_backup.tar.gz /opt/backups/
sudo chmod 444 /opt/backups/client_reports_backup.tar.gz
```

### Part 2: Log Filtering & Analysis
```bash
grep "sshd" /var/log/auth.log > /opt/log_reports/ssh_access.log

awk '/sshd.*Accepted/ {print $1, $2, $3, $9}' \
  /opt/log_reports/ssh_access.log > /opt/log_reports/summary.log
```

### Part 3: Archive Logs
```bash
tar -czvf /opt/log_reports/log_archive.tar.gz -C /opt/log_reports \
  ssh_access.log summary.log
```

### Part 4: Configure Log Rotation
```
# /etc/logrotate.d/ssh_access
/opt/log_reports/ssh_access.log {
    size 10k
    daily
    rotate 4
    compress
    missingok
    notifempty
}
```

```bash
sudo logrotate -f /etc/logrotate.d/ssh_access
```

## 🗂️ Repository Contents
- `LECTURE_25_COMMANDS.md` — Full command reference
- `screenshot_01_file_management.png` — Directory and permission setup
- `screenshot_02_backup_creation.png` — tar archive creation
- `screenshot_03_log_filtering.png` — grep and awk log analysis
- `screenshot_04_logrotate.png` — Log rotation configuration
- `screenshot_05_security_analysis.png` — Security log auditing

## 💡 Key Takeaways
- Use groups for multi-user access control and implement minimal permissions (least privilege)
- `grep` and `awk` extract structured insights from unstructured logs
- `logrotate` prevents disk space issues by automatically compressing and archiving old logs
- Always test `logrotate` with `sudo logrotate -f` before relying on scheduled rotation

---

**Day 25 Complete** ✅

Production log management mastered with rotation, filtering, and archiving.

#DevOps #AWS #Linux #LogManagement #logrotate #grep #awk #100DaysOfDevOps
