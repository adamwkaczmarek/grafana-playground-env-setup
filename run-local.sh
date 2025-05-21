#!/bin/bash

set -e

# Check if Minikube is installed
if ! command -v minikube &> /dev/null; then
  echo "❌ Minikube is not installed. Please install it first."
  exit 1
fi

# Check Minikube status
STATUS=$(minikube status -f={{.Host}} 2>/dev/null || echo "Stopped")

if [ "$STATUS" == "Running" ]; then
  echo "✅ Minikube is already running."
else
  echo "🚀 Starting Minikube..."
  minikube start
fi

./deploy.sh

