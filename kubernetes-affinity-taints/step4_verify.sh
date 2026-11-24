#!/bin/bash

PHASE=$(kubectl get pod pod-blue-vip -o jsonpath='{.status.phase}' 2>/dev/null)
POD_NODE=$(kubectl get pod pod-blue-vip -o jsonpath='{.spec.nodeName}' 2>/dev/null)
BLUE_NODE=$(kubectl get nodes -l location=room-blue -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)
TOL_KEY=$(kubectl get pod pod-blue-vip -o jsonpath='{.spec.tolerations[?(@.key=="access")].key}' 2>/dev/null)

if [ "$TOL_KEY" != "access" ]; then
  echo "Der Pod 'pod-blue-vip' benötigt eine Toleration für den Key 'access'."
  exit 1
fi

if [ "$PHASE" != "Running" ] || [ "$POD_NODE" != "$BLUE_NODE" ]; then
  echo "Der Pod 'pod-blue-vip' muss im Status 'Running' auf dem Node '$BLUE_NODE' laufen."
  exit 1
fi

exit 0