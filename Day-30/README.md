# Day-30: System File Finding & Pipelines

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Search for files using `find` and `locate`, and build complex auditing pipelines combining `cut`, `awk`, `sed`, and `grep` for production cloud administration.

## 🏭 Industry Scenario
DevOps Engineer at a software company tasked with finding configuration files in deployment directories, locating archived logs, and auditing IAM users, EC2 instances, and SSH logs using combined Linux commands.

## ✅ What I Practiced

### Part 1: find Command
```bash
find /opt/devops-app/configs -name "*.txt"
find /opt/devops-app/configs -name "*.txt" -mtime -7
find /opt/devops-app -type f -name "*.txt"
find /var/log -size +1M
find /var/log -name "*.log" -mtime +30 -delete
find /home -user ubuntu
```

### Part 2: locate Command
```bash
sudo apt update && sudo apt install plocate
sudo updatedb
locate backup.gz.tar
locate -i backup.gz.tar
locate -n 5 sshd_config
locate -c "*.conf"
```

### Part 3: Combined Command Pipelines

```bash
# cut + awk — Count EC2 instances per AZ
cut -d ',' -f 3,4 ec2_instances.csv | \
  awk -F ',' '{count[$2]++} END {for (zone in count) print zone, count[zone]}'

# cut + sed — Clean IAM user report
cut -d ',' -f 1,5 iam_users.csv | sed '1d'
```

### Real-Life Cloud Security Scenarios

```bash
# Get IAM users without MFA
cut -d ',' -f 1,4 iam_users.csv | awk -F ',' '$2 == "false" {print $1}'

# Extract failed SSH IPs and clean output
grep "Failed password" ~/auth.log | cut -d ' ' -f 11 | sed 's/[^0-9\.]//g'

# Full pipeline: IAM users without MFA but with console access
cut -d ',' -f 1,4,5 iam_users.csv | sed '1d' | \
  awk -F ',' '$2 == "false" && $3 == "true" {print $1}'
```

## 📊 find vs locate

| Feature | `find` | `locate` |
|---------|--------|----------|
| Search method | Scans filesystem in real time | Queries pre-built database |
| Speed | Slower | Faster |
| Accuracy | Always current | Depends on last `updatedb` run |
| Filter options | Rich (size, time, owner, type) | Basic (name pattern only) |
| Best for | Precise filtered searches | Quick system-wide lookup |

## 🗂️ Repository Contents
- `Lecture30_find_locate_Commands.md` — Full command reference
- `Untitled.png` through `Untitled2.png` — find/locate and pipeline screenshots

## 💡 Key Takeaways
- `find` is essential for precise, filtered searches (size, mtime, owner, type)
- `locate` is faster but requires a fresh `updatedb` after creating new files
- Combine `grep | cut | awk | sed` for powerful one-liner audits
- These pipelines are used daily in production for security reviews and compliance checks

---

**Day 30 Complete** ✅

Advanced file finding and command pipelines for log auditing.

#DevOps #AWS #Linux #find #locate #grep #awk #sed #Pipelines #100DaysOfDevOps
