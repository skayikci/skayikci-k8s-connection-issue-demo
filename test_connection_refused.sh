#!/bin/bash
echo "🧪 Test: Connection Refused"
cp ~/.kube/config ~/.kube/config.bak
kubectl config set-cluster fake-cluster --server=https://127.0.0.1:6443
kubectl config set-credentials fake-user --token=fake-token
kubectl config set-context fake-context --cluster=fake-cluster --user=fake-user
kubectl config use-context fake-context
kubectl get nodes --request-timeout=5s || echo "❌ Expected: Connection refused"
mv ~/.kube/config.bak ~/.kube/config
