# Day-20: Commands Reference

> **Note:** Commands below were extracted from the folder README and existing command reference files. The terminal screenshots in this folder could not be OCR-read because the current model does not support image input.

## Description
This session covers creating and verifying compressed tar archives (`.tar.gz` and `.tar.bz2`) and simulating backup and restore workflows using the `tar` command.

## Commands by Topic

### Task 1: Create and Extract Raw tar Archive
```bash
tar -cvf ~/backup-assignment/raw-backup.tar \
  ~/backup-assignment/app-logs \
  ~/backup-assignment/configs \
  ~/backup-assignment/docs

tar -tvf ~/backup-assignment/raw-backup.tar
tar -xvf ~/backup-assignment/raw-backup.tar -C ~/backup-assignment/extracted-raw
```

### Task 2: Compressed tar.gz Archive (tar + gzip)
```bash
tar -czvf ~/backup-assignment/compressed-backup.tar.gz \
  ~/backup-assignment/app-logs \
  ~/backup-assignment/configs \
  ~/backup-assignment/docs

tar -xzvf ~/backup-assignment/compressed-backup.tar.gz -C ~/backup-assignment/extracted-gz
```

### Task 3: Compressed tar.bz2 Archive (tar + bzip2)
```bash
tar -cjvf ~/backup-assignment/compressed-backup.tar.bz2 \
  ~/backup-assignment/app-logs \
  ~/backup-assignment/configs

tar -xjvf ~/backup-assignment/compressed-backup.tar.bz2 -C ~/backup-assignment/extracted-bz2
```
