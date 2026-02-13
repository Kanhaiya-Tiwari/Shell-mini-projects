

## ✅ **1️⃣ Shebang**

```bash
#!/bin/bash
```

👉 Tells Linux:

“Run this file using Bash shell.”

Without it:

❌ Wrong interpreter may run
❌ Script may fail

## ✅ **2️⃣ SOURCE Variable**

```bash
SOURCE="/var/www"
```

👉 Folder you want to back up.

Example use cases:

✔ Website files
✔ Application code
✔ Configurations


## ✅ **3️⃣ DEST Variable**

```bash
DEST="/backup"
```

👉 Where backup will be stored.

Could be:

✔ External disk
✔ Mounted volume
✔ NFS share

## ✅ **4️⃣ DATE Variable**

```bash
DATE=$(date +%F)
```

👉 Gets current date.

Example output:

```
2026-02-13
```

Why?

✔ Unique backup filename
✔ Prevent overwrite
✔ Easy history tracking

# ✅ **5️⃣ tar Command (Core of Script)**

```bash
tar -czf "$DEST/backup-$DATE.tar.gz" "$SOURCE"
```

This creates compressed archive.

---

## 🔹 **tar Options**

| Option | Meaning            |
| ------ | ------------------ |
| `-c`   | Create archive     |
| `-z`   | Compress with gzip |
| `-f`   | Filename           |

---

## 🔹 **Generated File Example**

```
/backup/backup-2026-02-13.tar.gz
```

---

## 🔹 **What Gets Stored?**

Everything inside:

```
/var/www
```

## ✅ **6️⃣ Completion Message**

```bash
echo "✅ Backup completed"
```

👉 Confirms success.


# 🖥 Example Execution Flow

Run script →

✔ Reads SOURCE
✔ Reads DEST
✔ Gets DATE
✔ Creates archive
✔ Prints message

---

# 🚀 Real DevOps Use Cases

This script is used for:

✔ Website backups
✔ Config backups
✔ Pre-deployment snapshots
✔ Disaster recovery

Because:

❌ Accidental deletion
❌ Server crash
❌ Bad deployment


# 🚨 Common Beginner Errors

---

## ❌ **DEST folder not exists**

Error:

```
tar: /backup/... Cannot open: No such file
```

Fix:

```bash
mkdir -p /backup
```
## ❌ **Permission denied**

Fix:

```bash
sudo ./backup.sh
```

OR adjust permissions.

## ❌ **tar not installed** (rare)

Fix:

```bash
sudo apt install tar
```

# ✅ Safer Improved Version

```bash
#!/bin/bash

SOURCE="/var/www"
DEST="/backup"
DATE=$(date +%F)

mkdir -p "$DEST"

tar -czf "$DEST/backup-$DATE.tar.gz" "$SOURCE"

if [ $? -eq 0 ]; then
    echo "✅ Backup completed successfully"
else
    echo "❌ Backup failed"
fi
```

👉 Adds:

✔ Destination check
✔ Success validation


# ⏱ Cron Automation (Real Usage)

Daily backup at 2 AM:

```bash
0 2 * * * /home/backup.sh
```

# 🎯 Interview Explanation

When asked:

**“Have you written Bash scripts?”**

Say:

✅ “Yes, I created an automated backup script.”
✅ “Compresses directories using tar.”
✅ “Uses dynamic date-based filenames.”
✅ “Designed for cron scheduling.”

💥 Sounds practical & real.

# 🚀 Future Enhancements You Can Add

✔ Auto-delete old backups
✔ Upload to S3
✔ Backup multiple directories
✔ Slack/email notification
✔ Encryption

