

## ✅ **1️⃣ Shebang**

```bash
#!/bin/bash
```

👉 Tells system:

“Run this script using Bash interpreter.”

Without it:

❌ Script may run with wrong shell
❌ Unexpected errors


## ✅ **2️⃣ Threshold Variable**

```bash
THRESHOLD=80
```

👉 Sets alert limit.

Meaning:

✔ If disk > 80% → Warning
✔ If disk ≤ 80% → Normal

Why variable?

✔ Easy to change
✔ Reusable
✔ Cleaner code


## ✅ **3️⃣ Disk Usage Calculation**

```bash
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
```

This is the **heart of the script**.

Let’s break it down.


### 🔹 **Step 1 – df /**

```bash
df /
```

👉 Shows disk usage of root partition.

Example output:

```
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/sda1       20511356 1600000  18000000  45% /
```

### 🔹 **Step 2 – tail -1**

```bash
tail -1
```

👉 Extracts last line (actual data).

Output:

```
/dev/sda1 20511356 1600000 18000000 45% /
```

### 🔹 **Step 3 – awk '{print $5}'**

```bash
awk '{print $5}'
```

👉 Extracts 5th column → `Use%`

Output:

```
45%
```

### 🔹 **Step 4 – sed 's/%//'**

```bash
sed 's/%//'
```

👉 Removes `%` symbol.

Output:

```
45
```

Now it's a **number**, usable for comparison.


### 🔹 **Final Result Stored**

```bash
USAGE=45
```

# ✅ **4️⃣ Condition Check**

```bash
if [ "$USAGE" -gt "$THRESHOLD" ];
```

Meaning:

✔ Compare usage vs threshold
✔ `-gt` = greater than

Example:

```
45 -gt 80 → FALSE
92 -gt 80 → TRUE
```

⚠️ Quotes `" "` prevent errors if variable empty.


# ✅ **5️⃣ Alert Logic**

---

## 🔥 **Case 1 – Disk High**

```bash
echo "⚠️ Disk usage critical: 92%"
```


## ✅ **Case 2 – Disk Normal**

```bash
echo "✅ Disk usage normal: 45%"
```

# 🎯 Real DevOps Use Case

This script is used for:

✔ Server monitoring
✔ Cron health checks
✔ Auto-alert systems
✔ Preventing outages

Because:

❌ Disk full → Services crash
❌ Logs stop writing
❌ DB corruption

# ⏱ **Production Usage via Cron**

Run every 5 minutes:

```bash
crontab -e
```

Add:

```bash
*/5 * * * * /home/disk_monitor.sh
```

👉 Automatic monitoring

# 🚨 Weaknesses of This Basic Script

Let’s be brutally honest.

❌ Only checks `/`
❌ No logging
❌ No alerts
❌ No multi-disk support

# 🚀 Production-Grade Upgrade

## ✅ **Add Logging**

```bash
LOGFILE="/var/log/disk_monitor.log"

echo "$(date) - Disk usage: $USAGE%" >> $LOGFILE
```

## ✅ **Add Email Alert**

```bash
echo "Disk critical: $USAGE%" | mail -s "Disk Alert" admin@example.com
```

## ✅ **Check Multiple Partitions**

```bash
df -h | grep '^/dev/'
```

Loop through them.


## ✅ **Auto Cleanup Action**

If disk > 90%:

✔ Delete old logs
✔ Clean temp files

# 🎯 Interview Gold Answer

If asked:

**“Have you written Bash scripts?”**

Say:

✅ “Yes, I built a disk monitoring script.”
✅ “Parses df output using awk & sed.”
✅ “Triggers alerts based on thresholds.”
✅ “Designed for cron automation.”
