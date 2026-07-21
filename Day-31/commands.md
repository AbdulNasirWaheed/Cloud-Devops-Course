# Day-31: Commands Reference

**#100DaysOfDevOps | DevOps & Cloud Journey**

## 📌 Topic
Bash Scripting Basics — Variables, shebangs, input processing, and shell fundamentals.

## 🔧 Commands

### What is a Shell?
- A shell is a command-line interface that interprets commands and runs scripts.
- Bash is the default shell on most Linux distributions and common in cloud environments.

### Shebang
```bash
#!/bin/bash
```

### Variables & Substitution
```bash
#!/bin/bash
NAME="DevOps"
echo "Hello, $NAME"
```

### Comments for Maintainability
```bash
#!/bin/bash
# This script automates user onboarding
```

### User Input
```bash
#!/bin/bash
echo "Enter your name:"
read username
echo "Welcome, $username"
```

### Basic Arithmetic
```bash
#!/bin/bash
a=10
b=20
echo $((a + b))
```

### Command Substitution
```bash
CURRENT_DATE=$(date)
echo "Today is $CURRENT_DATE"
```

### Secure Scripting Practices
- Always use `chmod +x script.sh` before execution
- Avoid hard-coding secrets in scripts
- Use relative paths or environment variables
- Validate user input

### Execution
```bash
chmod +x script.sh
./script.sh
```
