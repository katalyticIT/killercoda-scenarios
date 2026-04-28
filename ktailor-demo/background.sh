#!/bin/bash
exec > /var/log/background_setup.log 2>&1

cd /root/ktailor-demo
echo "Starting installation..."

# 1. Add Shortcuts/Aliases to .bashrc
echo "alias cls='clear'"  >> /root/.bashrc
echo "alias kc='kubectl'" >> /root/.bashrc
echo "alias ns='kubectl config set-context --current --namespace'" >> /root/.bashrc

# 2. Create Namespace
kubectl create namespace ktailor

# 3. Install cert-manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml

# 4. Wait for cert-manager
kubectl wait --for=condition=Available deployment/cert-manager-webhook -n cert-manager --timeout=120s
if [ $? -ne 0 ] ; then
  echo >/root/error.txt "Certificate manager couldn't be installed (in time). Perhaps there's not enough free ressources. Please try again later."
fi

# 5. Install kTailor from local assets
kubectl apply -f assets/rbac.yaml
kubectl apply -f assets/certs.yaml
kubectl apply -f assets/manifests.yaml

# Wait for kTailor
kubectl wait --for=condition=Available deployment/ktailor -n ktailor --timeout=60s

# 6. Install apps
kubectl apply -f /root/demo-app.yaml
kubectl apply -f /root/timetravel-app.yaml

kubectl wait --for=condition=Available deployment/timetravel-app -n default --timeout=60s


touch /root/.background_ready
