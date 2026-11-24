## Schritt 2: Pod auf dem Node `room-green` starten

Nun startest du den ersten Pod **`pod-green`**, der über `spec.nodeSelector` gezielt auf dem Node mit dem Label `location=room-green` eingeplant wird.

### 1. Manifest ansehen

Öffne die vorbereitete Datei `pod-green.yaml` mit `less` (beende die Ansicht anschließend mit der Taste **`q`**):

```bash
less pod-green.yaml
```{{exec}}

> **Hinweis zum Aufbau:** Über `spec.nodeSelector` fordert der Pod das Label `location: room-green`. Zusätzlich liest der Container über die **Downward API** (`spec.nodeName`) den Namen seines Host-Nodes in die Umgebungsvariable `NODE_NAME` ein und gibt ihn alle 5 Sekunden zusammen mit der Uhrzeit aus.

### 2. Pod erstellen

Wende das Manifest auf den Cluster an:

```bash
kubectl apply -f pod-green.yaml
```{{exec}}

### 3. Platzierung und Logs prüfen

Kontrolliere mit `-o wide` in der Spalte `NODE`, auf welchem Node der Pod läuft, und lies anschließend die Log-Ausgaben aus:

```bash
kubectl get pod pod-green -o wide
kubectl logs pod-green
```{{exec}}

*(Falls der Container noch startet, warte kurz und führe `kubectl logs pod-green` erneut aus.)*
