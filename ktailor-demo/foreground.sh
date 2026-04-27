#!/bin/bash
set +x
clear
echo "✨ Welcome to the kTailor Demo!"
echo "We are preparing your personal Kubernetes cluster in the background."
echo -n "Installing cert-manager and ktailor... "

while [ ! -f /root/.background_ready ]; do
  sleep 2
  echo -n "."
done

echo ""
echo "✅ Cluster is ready! Click 'Start' on the right to begin."
