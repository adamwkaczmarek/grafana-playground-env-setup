#!/bin/bash

set -e

# Check if Minikube is installed
if ! command -v minikube &> /dev/null; then
  echo "❌ Minikube is not installed. Please install it first."
  exit 1
fi

# Check Minikube status
# shellcheck disable=SC1083
STATUS=$(minikube status -f={{.Host}} 2>/dev/null || echo "Stopped")

if [ "$STATUS" == "Running" ]; then
  ./destroy.sh
  minikube stop
else
  echo "❌ Minikube is not running"
fi
