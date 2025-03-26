#!/bin/bash
echo "🔐 Simulating Kubernetes authentication failure..."

cp ~/.kube/config ~/.kube/config.bak

kubectl config set-cluster fake-auth-cluster --server=https://192.168.1.250:6443
kubectl config set-credentials fake-user --token=invalid-token
kubectl config set-context fake-auth-context --cluster=fake-auth-cluster --user=fake-user
kubectl config use-context fake-auth-context

kubectl get nodes --request-timeout=5s || echo "❌ Expected: Unauthorized or authentication failure."

mv ~/.kube/config.bak ~/.kube/config
kubectl config use-context $(kubectl config current-context) >/dev/null 2>&1 || true
echo "✅ Auth failure simulation complete."
