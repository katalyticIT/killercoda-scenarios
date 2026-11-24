## Schritt 5: Pods löschen und Taint zurücksetzen

Bereinige abschließend den Cluster:

### 1. Alle drei Pods löschen

```bash
kubectl delete pod pod-required pod-preferred pod-blue-vip
```{{exec}}

### 2. Taint vom Node `node01` entfernen

Durch ein angehängtes Minuszeichen (`-`) wird der Taint wieder entfernt:

```bash
kubectl taint nodes node01 access=restricted:NoSchedule-
```{{exec}}

### 3. Zustand überprüfen

Kontrolliere, dass keine Pods mehr im `default`-Namespace laufen:

```bash
kubectl get pods
```{{exec}}