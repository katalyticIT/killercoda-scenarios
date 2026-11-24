#!/bin/bash

PHASE=$(kubectl get pod pod-preferred -o jsonpath='{.status.phase}' 2>/dev/null)
POD_NODE=$(kubectl get pod pod-preferred -o jsonpath='{.spec.nodeName}' 2>/dev/null)
GREEN_NODE=$(kubectl get nodes -l location=room-green -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)
PREF=$(kubectl get pod pod-preferred -o jsonpath='{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution}' 2>/dev/null)

if [ -z "$PREF" ]; then
  echo "Der Pod 'pod-preferred' verwendet keine 'preferredDuringSchedulingIgnoredDuringExecution'-Regel."
  exit 1
fi

if [ "$PHASE" != "Running" ] || [ "$POD_NODE" != "$GREEN_NODE" ]; then
  echo "Der Pod 'pod-preferred' sollte im Status 'Running' auf '$GREEN_NODE' laufen."
  exit 1
fi

exit 0