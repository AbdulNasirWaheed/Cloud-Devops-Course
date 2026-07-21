# Day-29: Column Extraction with cut

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Extract specific columns and fields from structured text and CSV files using `cut`, combined with `grep` and `awk` for real-time cloud admin reporting.

## 🏭 Industry Scenario
Cloud Administrator at a SaaS company hosting services on AWS and Azure. Job requires extracting specific data from system reports to build a compliance dashboard covering EC2 status, IAM users, SSH access, and server performance.

## ✅ What I Practiced

### Basic Syntax
```bash
cut -d [delimiter] -f [field_number] [file]
```

### Basic Examples
```bash
cut -d ':' -f 1 /etc/passwd
cut -d ':' -f 7 /etc/passwd
grep "bash" /etc/passwd | cut -d ':' -f 1
cut -d ':' -f 1,7 /etc/passwd
```

### Intermediate Usage
```bash
cat ~/users.csv | cut -d ',' -f 2
grep "running" ~/ec2_instances.csv | cut -d ',' -f 2
```

### Cloud Admin Use Cases
```bash
cut -d ',' -f 1 ~/iam_users.csv
cut -d ',' -f 1,2 ~/ec2_instances.csv
cut -d ',' -f 5 ~/ec2_instances.csv
```

### Real-Time Cloud Log Audit
```bash
grep "Failed password" ~/auth.log | cut -d ' ' -f 11
```

## 📊 cut Quick Reference

| Command | Purpose | Cloud Admin Use Case |
|---------|---------|----------------------|
| `grep "ERROR" file` | Find errors | Check application logs |
| `grep -r "pattern" dir/` | Recursive search | Scan config directories |
| `cut -d ':' -f 1` | Extract 1st field | Parse system user list |
| `grep "ssh" \| cut -d ' ' -f 11` | Filter + extract field | Get SSH attacker IPs |
| `grep -v "127.0.0.1"` | Exclude local IPs | Filter access logs |
| `cut -d ',' -f 1,2` | Extract multiple columns | EC2 ID + name from inventory |
| `cut -d ',' -f 5` | Extract 5th column | Pull public IPs from CSV |

## 🗂️ Repository Contents
- `Lecture29_cut_Commands.md` — Full command reference
- `Untitled.png` through `Untitled3.png` — cut extraction screenshots

## 💡 Key Takeaways
- `cut` excels at extracting fixed-width columns from delimited files (CSV, `/etc/passwd`)
- Combine `grep | cut` for filter-then-extract pipelines
- Use `cut -d',' -f1,2` to extract multiple columns at once
- For complex field extraction and calculations, `awk` is more flexible than `cut`

---

**Day 29 Complete** ✅

Column extraction and text parsing for cloud reporting.

#DevOps #AWS #Linux #cut #TextProcessing #CSV #100DaysOfDevOps
