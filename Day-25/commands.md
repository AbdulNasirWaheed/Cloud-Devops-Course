# Day-25: Commands Reference

> **Note:** Commands below were extracted from the folder README and existing command reference files. The terminal screenshots in this folder could not be OCR-read because the current model does not support image input.

## Description
This session covers Linux file ownership and permissions, filtering and analyzing logs with `grep`/`awk`, creating compressed archives, and setting up `logrotate` for automatic log rotation in a production environment.

## Commands by Topic

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
```bash
sudo nano /etc/logrotate.d/ssh_access
```

Example logrotate config:
```text
/opt/log_reports/ssh_access.log {
    size 10k
    daily
    rotate 4
    compress
    missingok
    notifempty
}
```

Run logrotate:
```bash
sudo logrotate -f /etc/logrotate.d/ssh_access
```
