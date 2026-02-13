## ✅ **2️⃣ SERVICE Variable**

```bash
SERVICE="nginx"
```

👉 Name of service to check.

Can be:

✔ nginx
✔ docker
✔ ssh
✔ mysql
✔ any systemd service


# ✅ **3️⃣ Condition Check**

```bash
systemctl is-active --quiet $SERVICE
```

👉 Asks systemd:

“Is this service running?”

## 🔹 **What `is-active` Returns**

| Service State | Exit Code  |
| ------------- | ---------- |
| Running       | 0 ✅        |
| Not running   | Non-zero ❌ |

---

## 🔹 **What `--quiet` Does**

✔ Hides output
✔ Only exit code matters


# ✅ **4️⃣ IF Statement Logic**

```bash
if command; then
```

Meaning:

✔ Exit code 0 → TRUE
✔ Exit code ≠ 0 → FALSE

# ✅ **5️⃣ Running Case**

```bash
echo "✅ nginx is running"
```

# ❌ **6️⃣ Failure Case**

```bash
echo "❌ nginx is down — restarting"
systemctl restart nginx
```

👉 Auto-recovery action.

# 🖥 Example Scenarios

## ✅ **Case 1: Service Running**

Output:

```
✅ nginx is running
```

## ❌ **Case 2: Service Stopped**

Output:

```
❌ nginx is down — restarting
```

Then:

✔ systemctl restart nginx

# 🚀 Real DevOps Use Cases

Used for:

✔ Auto-healing
✔ Cron health checks
✔ Self-recovery scripts
✔ Incident reduction

Because:

❌ Services crash
❌ Memory leaks
❌ Unexpected failures

Automation reduces:

✅ Downtime
✅ Manual intervention

# ⏱ Cron Automation Example

Run every 1 minute:

```bash
* * * * * /home/check_nginx.sh
```

👉 Continuous monitoring

# 🚨 Common Beginner Errors


## ❌ **systemctl not found**

Cause:

✔ Running on Mac
✔ Running inside minimal container

Fix:

👉 Use service command OR Docker restart

## ❌ **Permission denied**

Fix:

```bash
sudo systemctl restart nginx
```
## ❌ **Wrong service name**

Check valid name:

```bash
systemctl list-units --type=service
```

# ✅ Safer Improved Version

```bash
#!/bin/bash

SERVICE="nginx"
LOGFILE="/var/log/service_monitor.log"

if systemctl is-active --quiet $SERVICE; then
  echo "$(date) ✅ $SERVICE running" >> $LOGFILE
else
  echo "$(date) ❌ $SERVICE down — restarting" >> $LOGFILE
  systemctl restart $SERVICE
fi
```

👉 Adds logging (VERY important in production)

# 🎯 Interview Explanation

Strong answer:

✅ “I built a Bash-based service health monitor.”
✅ “Uses systemctl exit codes.”
✅ “Implements automatic restart logic.”
✅ “Designed for cron-based auto-healing.”

💥 Sounds like real SRE/DevOps work.

# 🚀 Future Enhancements

✔ Slack/email alert on restart
✔ Retry limit
✔ Restart multiple services
✔ Detect flapping service
✔ Metrics export
