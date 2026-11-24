## Schritt 4: Pod gezielt auf dem geschützten Node `room-blue` starten

Um einen Pod auf `node01` (`location=room-blue`) zu platzieren, reicht Node Affinity allein nicht aus – der Taint `access=restricted:NoSchedule` würde den Pod weiterhin abweisen. Erst die Kombination aus **Node Affinity** und **Toleration** sorgt dafür, dass der Pod *genau* auf diesem geschützten Node startet.

### 1. Manifest ansehen

In `pod-blue-vip.yaml` sind sowohl die Hard Node Affinity für `room-blue` als auch die passende `tolerations`-Regel definiert:

```bash
cat pod-blue-vip.yaml
```{{exec}}

### 2. Pod starten

Wende das Manifest an:

```bash
kubectl apply -f pod-blue-vip.yaml
```{{exec}}

### 3. Node-Verteilung aller Pods prüfen

Überprüfe, dass `pod-blue-vip` nun erfolgreich auf `node01` läuft, während die anderen beiden Pods auf `controlplane` liegen:

```bash
kubectl get pods -o wide
```{{exec}}

### 4. Logs kontrollieren

Kontrolliere abschließend die Log-Ausgabe von `pod-blue-vip`:

```bash
kubectl logs pod-blue-vip
```{{exec}}