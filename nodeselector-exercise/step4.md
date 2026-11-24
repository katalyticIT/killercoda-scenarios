## Aufgabe 4: Verhalten bei unerfüllbarem `nodeSelector` beobachten

`nodeSelector` ist eine **harte Scheduling-Bedingung** (*Hard Requirement*). Was passiert, wenn ein Pod ein Label verlangt, das auf keinem Node im Cluster existiert?

1. Erstelle einen dritten Pod mit dem Namen **`pod-red`** (ebenfalls auf Basis von `busybox:1.36`), der einen `nodeSelector` für `location: room-red` definiert.
2. Überprüfe den Status des Pods mit `kubectl get pods`.
3. Untersuche die Details und Events des Pods mit `kubectl describe pod pod-red`, um die genaue Ursache für den Status zu sehen.

<details>
<summary>Hilfe &amp; Musterlösung anzeigen</summary>

Manifest `pod-red.yaml` erstellen und anwenden:
```bash
cat <<'EOF' > pod-red.yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-red
spec:
  nodeSelector:
    location: room-red
  containers:
  - name: logger
    image: busybox:1.36
    env:
    - name: NODE_NAME
      valueFrom:
        fieldRef:
          fieldPath: spec.nodeName
    command: ["/bin/sh", "-c"]
    args:
    - while true; do echo "$(date '+%H:%M:%S') - Pod läuft auf Node: $NODE_NAME"; sleep 5; done
EOF
kubectl apply -f pod-red.yaml
```{{exec}}

Status aller Pods prüfen (`pod-red` bleibt im Status `Pending` ohne zugewiesenen Node):
```bash
kubectl get pods -o wide
```{{exec}}

Scheduling-Fehlermeldung im Abschnitt `Events` nachlesen (`FailedScheduling: ... didn't match Pod's node affinity/selector`):
```bash
kubectl describe pod pod-red
```{{exec}}

</details>
