## Schritt 2: Hard Node Affinity mit dem `In`-Operator nutzen

Mit `nodeSelector` lässt sich immer nur genau ein Wert pro Label abfragen. Über **Node Affinity** kannst du dagegen mit dem Operator `In` eine Liste zulässiger Werte angeben.

### 1. Manifest ansehen

Wirf einen Blick in `pod-required.yaml`. Dort wird verlangt, dass das Label `location` entweder den Wert `room-green` oder `room-yellow` besitzt:

```bash
cat pod-required.yaml
```{{exec}}

### 2. Pod starten

Wende das Manifest auf den Cluster an:

```bash
kubectl apply -f pod-required.yaml
```{{exec}}

### 3. Platzierung überprüfen

Lass dir den Pod mit `-o wide` anzeigen. Da `controlplane` das Label `location=room-green` trägt, wird `pod-required` dort eingeplant:

```bash
kubectl get pod pod-required -o wide
```{{exec}}

### 4. Logs kontrollieren

Prüfe die Log-Ausgabe des Containers:

```bash
kubectl logs pod-required
```{{exec}}