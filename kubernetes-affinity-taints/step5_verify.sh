#!/bin/bash

for POD in pod-required pod-preferred pod-blue-vip; do
  if kubectl get pod "$POD" >/dev/null 2>&1; then
    echo "Der Pod '$POD' existiert noch. Bitte lösche alle drei Pods."
    exit 1
  fi
done

TAINT_CHECK=$(kubectl get node node01 -o jsonpath='{.spec.taints[?(@.key=="access")].key}' 2>/dev/null)
if [ -n "$TAINT_CHECK" ]; then
  echo "Der Taint 'access' ist auf 'node01' noch vorhanden. Bitte entferne ihn."
  exit 1
fi

exit 0