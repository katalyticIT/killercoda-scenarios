## Schritt 3: Pod auf dem Node `room-blue` starten

Als Nächstes startest du den zweiten Pod **`pod-blue`**, der über `location: room-blue` auf `node01` landen soll.

### 1. Manifest prüfen und Pod starten

Sieh dir `pod-blue.yaml` an und erstelle den Pod:

```bash
cat pod-blue.yaml
kubectl apply -f pod-blue.yaml
```{{exec}}

### 2. Node-Verteilung beider Pods vergleichen

Lass dir alle laufenden Pods mit `-o wide` anzeigen. `pod-green` sollte auf `controlplane` und `pod-blue` auf `node01` laufen:

```bash
kubectl get pods -o wide
```{{exec}}

### 3. Logs von `pod-blue` kontrollieren

Überprüfe im Log, dass der Container tatsächlich `node01` als ausführenden Node meldet:

```bash
kubectl logs pod-blue
```{{exec}}
