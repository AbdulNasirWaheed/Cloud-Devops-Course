# Day-18: Access Control & AWS IAM

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Objective
Configure Linux file permissions with `chmod` and manage AWS IAM users, groups, and policies — implementing the Least Privilege Principle on a real EC2 instance.

## 🏭 Industry Scenario
Cloud Administrator at CloudFinTech Ltd. setting up a new DevOps environment with Linux file permissions and AWS IAM access control on a live AWS EC2 instance.

## ✅ What I Practiced

### Part 1: Connect to EC2 via SSH
```bash
chmod 400 "ubuntu.pem"
ssh -i "ubuntu.pem" ubuntu@ec2-16-171-142-147.eu-north-1.compute.amazonaws.com
```

### Part 2: Linux File Permissions — chmod

| Command | Permissions | Use Case |
|---------|------------|----------|
| `chmod 700 backup.sh` | `rwx------` | Secure/private scripts |
| `chmod 755 install.sh` | `rwxr-xr-x` | Public executable scripts |
| `chmod 644 config.json` | `rw-r--r--` | Config and text files |
| `chmod 600 private.pem` | `rw-------` | SSH private keys (.pem) |
| `chmod 777 shared.log` | `rwxrwxrwx` | Test only — never production |
| `chmod +x script.sh` | adds `x` | Make script executable |
| `chmod -x report.sh` | removes `x` | Remove execute permission |

### Part 3: AWS IAM — Create User & Assign Role
```
IAM → Users → Create user
  Username:   devops_user1
  Access:     AWS Management Console access
  Password:   Auto-generated
```

### Part 4: Create IAM Group & Assign Policy
```
IAM → User Groups → Create group
  Group name:  DevOpsReadOnly
  Add user:    devops_user1
  Policy:      AmazonEC2ReadOnlyAccess
```

### Part 5: Verify Permissions (Least Privilege)
- EC2 Read → ALLOWED (view instances)
- EC2 Launch → DENIED (`ec2:CreateSecurityGroup action denied`)

## 🗂️ Repository Contents
- `commands.md` — Full command reference and walkthrough
- `preview.webp` through `preview (9).webp` — SSH, chmod, and IAM console screenshots

## 💡 Key Learnings
- Always `chmod 400` your `.pem` key before SSH — AWS enforces this
- IAM Groups scale permission management — assign policies to groups, not individuals
- Least Privilege Principle = give users only the permissions they need
- A read-only IAM user can view EC2 instances but cannot launch new ones

---

**Day 18 Complete** ✅

Mastering Linux access controls and cloud identity management.

#DevOps #AWS #IAM #chmod #Linux #100DaysOfDevOps
