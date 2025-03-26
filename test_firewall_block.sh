#!/bin/bash
echo "🚧 Simulating firewall blocking port 6443..."

cp ~/.kube/config ~/.kube/config.bak

kubectl config set-cluster firewall-cluster --server=https://192.168.1.250:6443
kubectl config set-credentials firewall-user --token=fake-token
kubectl config set-context firewall-context --cluster=firewall-cluster --user=firewall-user
kubectl config use-context firewall-context

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "🔒 Blocking port 6443 temporarily with iptables (requires sudo)..."
  sudo iptables -A OUTPUT -p tcp --dport 6443 -j DROP

  kubectl get nodes --request-timeout=5s || echo "❌ Expected: Timeout or connection refused."

  echo "🔓 Reverting iptables rule..."
  sudo iptables -D OUTPUT -p tcp --dport 6443 -j DROP
else
  echo "⚠️ Firewall simulation only works on Linux with iptables."
fi

mv ~/.kube/config.bak ~/.kube/config
kubectl config use-context $(kubectl config current-context) >/dev/null 2>&1 || true
echo "✅ Firewall block simulation complete."
