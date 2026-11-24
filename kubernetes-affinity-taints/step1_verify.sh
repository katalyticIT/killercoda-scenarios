#!/bin/bash

GREEN_NODE=$(kubectl get nodes -l location=room-green -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)
BLUE_NODE=$(kubectl get nodes -l location=room-blue -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)

if [ -z "$GREEN_NODE" ] || [ -z "$BLUE_NODE" ] || [ "$GREEN_NODE" == "$BLUE_NODE" ]; then
  echo "Bitte weise einem Node das Label 'location=room-green' und dem anderen 'location=room-blue' zu."
  exit 1
fi

TAINT_EFFECT=$(kubectl get node "$BLUE_NODE" -o jsonpath='{.spec.taints[?(@.key=="access")].effect}' 2>/dev/null)
TAINT_VALUE=$(kubectl get node "$BLUE_NODE" -o jsonpath='{.spec.taints[?(@.key=="access")].value}' 2>/dev/null)

if [ "$TAINT_EFFECT" != "NoSchedule" ] || [ "$TAINT_VALUE" != "restricted" ]; then
  echo "Der Node '$BLUE_NODE' benötigt den Taint 'access=restricted:NoSchedule'."
  exit 1
fi

exit 0