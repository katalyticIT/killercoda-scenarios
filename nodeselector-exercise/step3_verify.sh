#!/bin/bash

PHASE=$(kubectl get pod pod-blue -o jsonpath='{.status.phase}' 2>/dev/null)
SELECTOR=$(kubectl get pod pod-blue -o jsonpath='{.spec.nodeSelector.location}' 2>/dev/null)
POD_NODE=$(kubectl get pod pod-blue -o jsonpath='{.spec.nodeName}' 2>/dev/null)
BLUE_NODE=$(kubectl get nodes -l location=room-blue -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)

if [ "$PHASE" != "Running" ]; then
  echo "Der Pod 'pod-blue' läuft noch nicht (aktueller Status: ${PHASE:-nicht gefunden})."
  exit 1
fi

if [ "$SELECTOR" != "room-blue" ]; then
  echo "Der Pod 'pod-blue' verwendet nicht den nodeSelector 'location: room-blue'."
  exit 1
fi

if [ "$POD_NODE" != "$BLUE_NODE" ]; then
  echo "Der Pod 'pod-blue' läuft nicht auf dem Node '$BLUE_NODE'."
  exit 1
fi

exit 0
