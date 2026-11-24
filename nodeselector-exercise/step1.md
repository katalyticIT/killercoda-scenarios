## Aufgabe 1: Cluster-Nodes inspizieren und labeln

Dir steht ein Kubernetes-Cluster mit zwei Nodes (`controlplane` und `node01`) zur Verfügung. In dieser Umgebung sind beide Nodes für reguläre Workloads freigegeben.

1. Lass dir zunächst alle Nodes inklusive ihrer aktuellen Labels anzeigen.
2. Vergib anschließend folgende Standort-Labels:
   - **`controlplane`** erhält das Label `location=room-green`
   - **`node01`** erhält das Label `location=room-blue`
3. Überprüfe abschließend, ob beide Labels korrekt gesetzt wurden.

<details>
<summary>Hilfe &amp; Musterlösung anzeigen</summary>

Vorhandene Nodes und Labels prüfen:
```bash
kubectl get nodes --show-labels
```{{exec}}

Labels auf den beiden Nodes setzen:
```bash
kubectl label nodes controlplane location=room-green
kubectl label nodes node01 location=room-blue
```{{exec}}

Ergebnis gezielt über die Label-Spalte kontrollieren:
```bash
kubectl get nodes -L location
```{{exec}}

</details>
