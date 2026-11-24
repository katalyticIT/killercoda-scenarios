## Schritt 3: Soft Node Affinity (Wunsch-Präferenz ohne Blockade)

Im ersten Szenario blieb ein Pod für den nicht existierenden Raum `room-red` dauerhaft im Status `Pending` hängen. Mit **`preferredDuringSchedulingIgnoredDuringExecution`** formulierst du stattdessen einen **Wunsch** inklusive Gewichtung (`weight: 1` bis `100`).

### 1. Manifest ansehen

Prüfe `pod-preferred.yaml`. Der Pod bevorzugt `location: room-red` mit `weight: 100`:

```bash
cat pod-preferred.yaml
```{{exec}}

### 2. Pod starten

Erstelle den Pod:

```bash
kubectl apply -f pod-preferred.yaml
```{{exec}}

### 3. Alle Pods überprüfen

Beobachte in der Übersicht, auf welchem Node `pod-preferred` startet:

```bash
kubectl get pods -o wide
```{{exec}}

> **Warum landet der Pod auf `controlplane`?** Kein Node besitzt `location=room-red`, also weicht der Scheduler aus. Von den beiden verbleibenden Nodes darf er jedoch nur `controlplane` nutzen, weil `node01` durch den Taint `access=restricted:NoSchedule` geschützt ist.

### 4. Logs kontrollieren

Lies das Log von `pod-preferred` aus:

```bash
kubectl logs pod-preferred
```{{exec}}