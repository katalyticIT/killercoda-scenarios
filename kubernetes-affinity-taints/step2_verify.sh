#!/bin/bash

PHASE=$(kubectl get pod pod-required -o jsonpath='{.status.phase}' 2>/dev/null)
POD_NODE=$(kubectl get pod pod-required -o jsonpath='{.spec.nodeName}' 2>/dev/null)
GREEN_NODE=$(kubectl get nodes -l location=room-green -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)
AFFINITY=$(kubectl get pod pod-required -o jsonpath='{.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution}' 2>/dev/null)

if [ -z "$AFFINITY" ]; then
  echo "Der Pod 'pod-required' definiert keine 'requiredDuringSchedulingIgnoredDuringExecution'-Regel."
  exit 1
fi

if [ "$PHASE" != "Running" ] || [ "$POD_NODE" != "$GREEN_NODE" ]; then
  echo "Der Pod 'pod-required' muss im Status 'Running' auf dem Node '$GREEN_NODE' laufen."
  exit 1
fi

exit 0