# Day-27: Commands Reference

> **Note:** The terminal screenshots in this folder could not be OCR-read because the current model does not support image input. The commands below are derived from the folder README and the course roadmap. Exact commands from the session screenshots should be added once they are transcribed.

## Description
This session covers the `sed` command for stream editing, text transformation, configuration management, and real-time log processing. Topics include printing/deleting lines, substitution, global replacements, in-place editing (`-i`), inserting lines, regex, commenting lines, and appending content.

## Commands by Topic

### sed Basics
```bash
sed '2d' file
sed 's/old/new/' file
sed 's/old/new/g' file
```

### In-Place Editing
```bash
sed -i 's/old/new/g' file
```

### Intermediate & Advanced Usage
```bash
sed '1i# Header' file
sed 'a# Footer' file
sed '/pattern/s/old/new/g' file
sed '/^#/d' file
sed -n '1,10p' file
```

### Real Cloud Admin Tasks
```bash
sed -i 's/Listen 80/Listen 8080/g' /etc/nginx/nginx.conf
sed -i 's/DB_PASS=.*/DB_PASS=secret/' .env
sed -i 's/password.*/password=redacted/' app.log
sed -i 's/old_region/new_region/' deploy.sh
sed -i 's/port 22/port 2222/' security_rules.tf
```
