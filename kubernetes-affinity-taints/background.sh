#!/bin/bash

# Warten, bis der Cluster bereit ist, und Standard-Controlplane-Taint entfernen
until kubectl get node controlplane >/dev/null 2>&1; do
  sleep 2
done

kubectl taint nodes controlplane node-role.kubernetes.io/control-plane- || true