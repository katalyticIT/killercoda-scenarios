#!/bin/bash

PHASE=$(kubectl get pod pod-red -o jsonpath='{.status.phase}' 2>/dev/null)
SELECTOR=$(kubectl get pod pod-red -o jsonpath='{.spec.nodeSelector.location}' 2>/dev/null)

if [ "$SELECTOR" != "room-red" ]; then
  echo "Der Pod 'pod-red' existiert nicht oder hat nicht den nodeSelector 'location: room-red'."
  exit 1
fi

if [ "$PHASE" != "Pending" ]; then
  echo "Der Pod 'pod-red' sollte im Status 'Pending' verbleiben (aktuell: $PHASE)."
  exit 1
fi

exit 0
