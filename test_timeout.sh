#!/bin/bash
echo "🧪 Test: Timeout"
cp ~/.kube/config ~/.kube/config.bak
kubectl config set-cluster fake-cluster --server=https://192.168.255.255:6443
kubectl config set-credentials fake-user --token=fake-token
kubectl config set-context fake-context --cluster=fake-cluster --user=fake-user
kubectl config use-context fake-context
kubectl get nodes --request-timeout=5s || echo "❌ Expected: i/o timeout"
mv ~/.kube/config.bak ~/.kube/config
