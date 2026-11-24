## Aufgabe 3: Pod auf dem Node `room-blue` starten

Wiederhole das Prinzip nun für den zweiten Standort und starte einen Pod mit dem Namen **`pod-blue`** auf dem Node mit dem Label `location=room-blue`.

**Anforderungen an den Pod:**
- **Name:** `pod-blue`
- **Image:** `busybox:1.36`
- **Scheduling:** `nodeSelector` auf `location: room-blue`
- **Ausgabe im Log:** Alle **5 Sekunden** die aktuelle Uhrzeit und den Namen des Nodes ausgeben.

Prüfe anschließend wieder:
1. Auf welchem Node läuft `pod-blue`?
2. Welche Ausgaben erscheinen im Log von `pod-blue`?

<details>
<summary>Hilfe &amp; Musterlösung anzeigen</summary>

Manifest `pod-blue.yaml` erstellen und anwenden:
```bash
cat <<'EOF' > pod-blue.yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-blue
spec:
  nodeSelector:
    location: room-blue
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
kubectl apply -f pod-blue.yaml
```{{exec}}

Platzierung beider Pods auf den unterschiedlichen Nodes vergleichen:
```bash
kubectl get pods -o wide
```{{exec}}

Logs von `pod-blue` kontrollieren:
```bash
kubectl logs pod-blue
```{{exec}}

</details>
