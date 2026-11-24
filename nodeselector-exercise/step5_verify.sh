#!/bin/bash

for POD in pod-green pod-blue pod-red; do
  if kubectl get pod "$POD" >/dev/null 2>&1; then
    echo "Der Pod '$POD' ist noch vorhanden. Bitte lösche alle drei Pods."
    exit 1
  fi
done

exit 0
