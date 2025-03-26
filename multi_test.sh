#!/bin/bash
echo "🚀 Running all K8s connection tests..."
./test_connection_refused.sh
./test_timeout.sh
./test_missing_kubeconfig.sh
./test_firewall_block.sh
./test_auth_failure.sh
echo "✅ All tests executed."
