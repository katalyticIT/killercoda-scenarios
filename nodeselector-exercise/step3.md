## Schritt 3: Pod auf dem Node `room-blue` starten

Als Nächstes startest du den zweiten Pod **`pod-blue`**, der über `location: room-blue` auf `node01` landen soll.

### 1. Manifest prüfen

Sieh dir `pod-blue.yaml` mit `cat` an:

```bash
cat pod-blue.yaml
```{{exec}}

### 2. Pod starten

Erstelle nun den Pod:

```bash
kubectl apply -f pod-blue.yaml
```{{exec}}

### 3. Node-Verteilung und Logs kontrollieren

Lass dir alle laufenden Pods mit `-o wide` anzeigen (`pod-green` läuft auf `controlplane`, `pod-blue` auf `node01`) und kontrolliere anschließend das Log von `pod-blue`:

```bash
kubectl get pods -o wide
kubectl logs pod-blue
```{{exec}}
