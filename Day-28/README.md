# Day-28: Pattern Searching with grep

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Master the `grep` command for log auditing, security incident detection, SSH configuration review, and production cloud administration tasks.

## 🏭 Industry Scenario
Junior DevOps Engineer at a cloud-based SaaS company managing AWS EC2 instances. Daily job includes monitoring production logs, detecting errors, auditing SSH access, and validating configs using `grep`, `awk`, `sed`, and `cut`.

## ✅ What I Practiced

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

## 📊 grep Options Quick Reference

| Option | Description | Example |
|--------|-------------|---------|
| `-i` | Case-insensitive search | `grep -i "error" file.log` |
| `-n` | Show line numbers | `grep -n "fail" auth.log` |
| `-r` | Recursive directory search | `grep -r "root" /etc/ssh/` |
| `-v` | Invert match (exclude pattern) | `grep -v "info" syslog.log` |
| `-o` | Print only the matched part | `grep -o "error.*" syslog.log` |
| `-E` | Extended regex | `grep -E "([0-9]{1,3}\.){3}" file` |
| `-c` | Count matching lines | `grep -c "sshd" auth.log` |
| `--color` | Highlight matches | `grep --color=auto "ssh" auth.log` |

## 🗂️ Repository Contents
- `Lecture28_grep_Commands.md` — Full command reference
- `Untitled.png` through `Untitled4.png` — grep command screenshots

## 💡 Key Takeaways
- `grep` is the primary tool for log auditing and security incident detection
- Combine `grep -r` with directory paths for recursive config audits
- Use `grep -E` for extended regex patterns (e.g., IP addresses, weak SSH settings)
- `grep -v` inverts matches — useful for excluding localhost or noise from logs

---

**Day 28 Complete** ✅

Pattern searching with grep for production log analysis.

#DevOps #AWS #Linux #grep #LogAnalysis #Security #100DaysOfDevOps
