# Day-28: Commands Reference

> **Note:** The terminal screenshots in this folder could not be OCR-read because the current model does not support image input. The commands below are extracted from the folder README and the existing `Lecture28_grep_Commands.md` reference file. Exact commands from the session screenshots should be added once they are transcribed.

## Description
This session covers pattern searching with `grep` for log auditing, security incident detection, SSH configuration review, and production cloud administration tasks.

## Commands by Topic

### Basic grep Commands
```bash
grep "error" /var/log/syslog
grep -i "error" /var/log/syslog
grep -n "failed" /var/log/auth.log
grep -r "PermitRootLogin" /etc/ssh/
```

### Intermediate grep Commands
```bash
grep -v "127.0.0.1" /etc/hosts
grep -o "error.*" /var/log/syslog
grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" /var/log/syslog
```

### Advanced grep Commands
```bash
ps aux | grep nginx
grep -c "sshd" /var/log/auth.log
grep --color=auto "ssh" /var/log/auth.log
```

### Cloud Admin Use Cases
```bash
grep "SUCCESS" /var/log/cloud-init.log
grep "Accepted" /var/log/auth.log
grep "0.0.0.0/0" ~/security_groups.csv
grep -E "PermitRootLogin|PasswordAuthentication" ~/sshd_config
```
