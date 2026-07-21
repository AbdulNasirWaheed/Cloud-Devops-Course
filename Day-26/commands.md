# Day-26: Commands Reference

> **Note:** The terminal screenshots in this folder could not be OCR-read because the current model does not support image input. The commands below are derived from the folder README and the course roadmap. Exact commands from the session screenshots should be added once they are transcribed.

## Description
This session covers AWK for powerful text processing, pattern matching, and real-time production log analysis. Topics include syntax, fields (`$1`, `$NF`), custom separators, `BEGIN`/`END` blocks, mathematical operations, data cleaning with `gsub()`, and real log analysis techniques.

## Commands by Topic

### AWK Basics
```bash
awk '{print $1}' file
awk '{print $NF}' file
```

### BEGIN / END Blocks
```bash
awk 'BEGIN {print "Start"} {print $0} END {print "End"}' file
```

### Advanced Processing
```bash
awk '/pattern/ {sum += $3} END {print sum}' file
awk '{gsub(/old/, "new"); print}' file
```

### Real Log Analysis
```bash
awk 'NF != 9 {print "Malformed:", $0}' access.log
awk '$9 >= 400 {print $0}' access.log
```
