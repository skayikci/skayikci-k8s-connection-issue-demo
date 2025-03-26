
# 🧪 Kubernetes Connection Issue Demo

This repository contains scripts to simulate common Kubernetes connection errors using `kubectl`. It's designed for testing, education, or demo purposes—especially useful for troubleshooting or showcasing how different connectivity issues appear.

---

## 📂 Contents

- `test_connection_issue.sh`  
  Simulates:
  - Unreachable Kubernetes API server (wrong IP)
  - Missing kubeconfig file
  - Port block simulation via `iptables` (Linux only)

---

## 🚀 How to Use

> **Important:** This modifies your current kubeconfig. Your original config will be backed up and restored automatically.

### ✅ Prerequisites
- `kubectl` installed and configured
- Access to `~/.kube/config`
- For port block simulation: `iptables` and `sudo` privileges (Linux only)

### 🛠 Run the Script

```bash
chmod +x test_connection_issue.sh
./test_connection_issue.sh
```

You will see a step-by-step simulation of different connection problems and their respective `kubectl` outputs.

---

## ⚠️ Warning

- Use this only in **local or test environments**.
- Avoid running on production clusters or sensitive machines.
- Make sure you have the necessary permissions before using `iptables`.

---

## 🙋‍♂️ Author

**Serhat-Freelancing**

---

## 📎 License

MIT License. Use freely with attribution.
