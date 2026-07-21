# Day-19: Commands Reference

> **Note:** Commands below were extracted from the folder README and existing command reference files. The terminal screenshots in this folder could not be OCR-read because the current model does not support image input.

## Description
This session covers data compression and restore workflows on Linux. Topics include compressing and decompressing single files with `gzip` and `bzip2`, and archiving multiple files with `zip`/`unzip`.

## Commands by Topic

### gzip — Compress & Decompress a Single File
```bash
gzip ~/backup-assignment/app-logs/log1.txt
gzip -d ~/backup-assignment/app-logs/log1.txt.gz
```

### zip — Archive Multiple Files & Directories
```bash
zip -r ~/backup-assignment/full-backup.zip \
  ~/backup-assignment/app-logs/log2.txt \
  ~/backup-assignment/configs/app.conf \
  ~/backup-assignment/docs/

unzip -l ~/backup-assignment/full-backup.zip
unzip ~/backup-assignment/full-backup.zip -d ~/backup-assignment/restored
```

### bzip2 — Compress & Decompress
```bash
bzip2 ~/backup-assignment/configs/env.conf
bunzip2 ~/backup-assignment/configs/env.conf.bz2
```
