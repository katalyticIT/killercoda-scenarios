#!/bin/bash
exec > /var/log/background_setup.log 2>&1

# Move into scenario directory to access assets
cd /root/ktailor-demo

echo "Starting localized installation..."

# 1. Create Namespace
kubectl create namespace ktailor

# 2. Install cert-manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml

# 3. Wait for cert-manager
kubectl wait --for=condition=Available deployment/cert-manager-webhook -n cert-manager --timeout=120s

# 4. Install kTailor from local assets
kubectl apply -f assets/rbac.yaml
kubectl apply -f assets/certs.yaml
kubectl apply -f assets/manifests.yaml

# Wait for kTailor
kubectl wait --for=condition=Available deployment/ktailor -n ktailor --timeout=60s

# 5. Prepare Demo Files (remain in /root for the user)
cat << 'EOF' > /root/demo-app.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-app
  labels:
    ktailor.dev/fit: "central.ktailor-test"
spec:
  replicas: 1
  selector:
    matchLabels:
      app: demo
  template:
    metadata:
      labels:
        app: demo
    spec:
      containers:
      - name: main-app
        image: nginx:alpine
EOF

cat << 'EOF' > /root/demo-template.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: ktailor-test
  namespace: ktailor
  labels:
    ktailor.dev/template: "true"
data:
  template: |
    modifyContainers:
      insertOrOverwrite:
        env:
          - name: KTAILORTEST
            value: "Hello from local Killercoda assets!"
EOF

cat << 'EOF' > /root/timetravel-template.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: lft-plus222d
  namespace: default
  labels:
    ktailor.dev/template: "true"
data:
  template: |
    modifyContainers:
      insertIfNotExists:
        volumeMounts:
          - name: shared-lft-volume
            mountPath: /lft_volume
      insertOrOverwrite:
        env:
          - name: FAKETIME
            value: "+222d"
      setOrAppend:
        env:
          - name: LD_PRELOAD
            value: "/lft_volume/libfaketime.so.1"
            separator: ":"
    addInitContainers:
      - name: inject-libfaketime
        image: katalytic/libfaketime_init:1.0
        env:
          - name: LFT_DESTPATH
            value: /lft_volume
        volumeMounts:
        - name: shared-lft-volume
          mountPath: /lft_volume
    addVolumes:
      volumes:
        - name: shared-lft-volume
          emptyDir: {}
EOF

cat << 'EOF' > /root/timetravel-app.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: timetravel-app
  labels:
    ktailor.dev/fit: "local.lft-plus222d"
spec:
  replicas: 1
  selector:
    matchLabels:
      app: timetravel
  template:
    metadata:
      labels:
        app: timetravel
    spec:
      containers:
      - name: my-app
        image: busybox
        command: ["sleep", "3600"]
EOF

touch /root/.background_ready
