# Day 26: Real-Time Log Analysis Using AWK on Linux

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Master AWK for powerful text processing, pattern matching, and real-time production log analysis.

## 🏭 Industry Scenario
As a Junior DevOps Engineer at a cloud SaaS company, I analyzed production `access.log` files daily to:
- Identify error patterns (4xx, 5xx)
- Track successful requests
- Detect malformed entries
- Extract meaningful insights quickly

## ✅ What I Practiced

### Part 1 — AWK Basics
- Syntax, fields (`$1`, `$NF`), and pattern matching
- Custom separators and output formatting

### Part 2 — Advanced Processing
- `BEGIN` / `END` blocks
- Mathematical operations (sum, average)
- Data cleaning with `gsub()`

### Part 3 — Real Log Analysis
- Malformed entry detection using `NF`
- Error filtering (`status >= 400`)
- Clean extraction of successful requests

## 🗂️ Repository Contents
- `sample.txt` — Structured data examples
- `access.log` — Sample web server log with errors and malformed line
- Practice commands and notes

## 🚀 Next Steps
- Automate daily log reports with cron + AWK
- Integrate findings with CloudWatch / ELK Stack
- Explore associative arrays for advanced grouping

---

**Day 26 Complete** ✅

Building production-ready Linux and observability skills.

#DevOps #AWS #Linux #AWK #LogAnalysis #100DaysOfDevOps