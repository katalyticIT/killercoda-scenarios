#!/bin/bash

PHASE=$(kubectl get pod pod-green -o jsonpath='{.status.phase}' 2>/dev/null)
SELECTOR=$(kubectl get pod pod-green -o jsonpath='{.spec.nodeSelector.location}' 2>/dev/null)
POD_NODE=$(kubectl get pod pod-green -o jsonpath='{.spec.nodeName}' 2>/dev/null)
GREEN_NODE=$(kubectl get nodes -l location=room-green -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)

if [ "$PHASE" != "Running" ]; then
  echo "Der Pod 'pod-green' läuft noch nicht (aktueller Status: ${PHASE:-nicht gefunden})."
  exit 1
fi

if [ "$SELECTOR" != "room-green" ]; then
  echo "Der Pod 'pod-green' verwendet nicht den nodeSelector 'location: room-green'."
  exit 1
fi

if [ "$POD_NODE" != "$GREEN_NODE" ]; then
  echo "Der Pod 'pod-green' läuft nicht auf dem Node '$GREEN_NODE'."
  exit 1
fi

exit 0
