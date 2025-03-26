#!/bin/bash
echo "🧪 Test: Missing Kubeconfig"
export KUBECONFIG=/tmp/nonexistent_config.yaml
kubectl get nodes --request-timeout=3s || echo "❌ Expected: No configuration provided"
