#!/bin/bash
exec > /var/log/background_setup.log 2>&1

cd /root/ktailor-demo
echo "Starting installation..."

# 1. Add Shortcuts/Aliases to .bashrc
echo "alias cls='clear'"  >> /root/.bashrc
echo "alias kc='kubectl'" >> /root/.bashrc
echo "alias ns='kubectl config set-context --current --namespace'" >> /root/.bashrc

# 2. install nginx for access with browser
sudo apt-get -y -qq install nginx
sudo cp assets/etc.nginx.sites-enabled.default /etc/nginx/sites-enabled/default
sudo systemctl reload nginx.service
touch /root/.nginx_ready

# 2. Create Namespace
kubectl create namespace ktailor

# 3. Install cert-manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml

# 4. Wait for cert-manager pods
kubectl wait --for=condition=Available deployment/cert-manager-cainjector -n cert-manager --timeout=120s
EC=$?
kubectl wait --for=condition=Available deployment/cert-manager-webhook    -n cert-manager --timeout=30s
let EC=$EC+$?
kubectl wait --for=condition=Available deployment/cert-manager            -n cert-manager --timeout=10s
let EC=$EC+$?

if [ $EC -ne 0 ] ; then
  echo >/root/error.txt "Certificate manager couldn't be installed (in time). Perhaps there's not enough free ressources. Please try again later."
fi
touch /root/.certmanager_ready

echo "========"
kubectl get pods -A
echo "========"

# 5. Install kTailor from local assets
kubectl apply -f assets/setup.yaml

# Wait for kTailor
kubectl wait --for=condition=Available deployment/ktailor -n ktailor --timeout=60s
touch /root/.ktailor_ready

# 6. Install the kTailor templates
kubectl apply -f timetravel-template-1985.yaml
kubectl apply -f timetravel-template-2015.yaml

# 7. Install apps
kubectl apply -f assets/apps.yaml
kubectl wait --for=condition=Available deployment/marty-mcfly  -n default --timeout=60s
touch /root/.apps_ready


touch /root/.background_ready
