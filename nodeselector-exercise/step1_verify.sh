#!/bin/bash

GREEN_NODE=$(kubectl get nodes -l location=room-green -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)
BLUE_NODE=$(kubectl get nodes -l location=room-blue -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)

if [ -z "$GREEN_NODE" ] || [ -z "$BLUE_NODE" ]; then
  echo "Bitte stelle sicher, dass ein Node das Label 'location=room-green' und der andere das Label 'location=room-blue' trägt."
  exit 1
fi

if [ "$GREEN_NODE" == "$BLUE_NODE" ]; then
  echo "Die Labels 'location=room-green' und 'location=room-blue' müssen auf zwei unterschiedliche Nodes verteilt sein."
  exit 1
fi

exit 0
