## Aufgabe 2: Pod auf dem Node `room-green` starten

Erstelle nun einen Pod mit dem Namen **`pod-green`**, der ausschließlich auf dem Node mit dem Label `location=room-green` eingeplant wird.

**Anforderungen an den Pod:**
- **Name:** `pod-green`
- **Image:** `busybox:1.36`
- **Scheduling:** `nodeSelector` auf `location: room-green`
- **Ausgabe im Log:** Alle **5 Sekunden** sollen die aktuelle Uhrzeit und der Name des ausführenden Nodes ausgegeben werden.

> **Tipp:** Über die Kubernetes **Downward API** (`valueFrom.fieldRef.fieldPath: spec.nodeName`) kannst du den Namen des aktuellen Nodes als Umgebungsvariable (z. B. `NODE_NAME`) an den Container übergeben.

Nach dem Start des Pods:
1. Prüfe mit `kubectl`, auf welchem Node `pod-green` tatsächlich läuft.
2. Kontrolliere die Log-Ausgaben des Pods.

<details>
<summary>Hilfe &amp; Musterlösung anzeigen</summary>

Manifest `pod-green.yaml` erstellen und anwenden:
```bash
cat <<'EOF' > pod-green.yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-green
spec:
  nodeSelector:
    location: room-green
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
kubectl apply -f pod-green.yaml
```{{exec}}

Prüfen, auf welchem Node der Pod eingeplant wurde (Spalte `NODE`):
```bash
kubectl get pod pod-green -o wide
```{{exec}}

Logs kontrollieren (mit `Strg+C` beenden, falls `-f` genutzt wird):
```bash
kubectl logs pod-green
```{{exec}}

</details>
