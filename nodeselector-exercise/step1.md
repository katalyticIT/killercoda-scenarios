## Schritt 1: Cluster-Nodes inspizieren und labeln

Dir steht ein Kubernetes-Cluster mit zwei Nodes (`controlplane` und `node01`) zur Verfügung. In dieser Umgebung sind beide Nodes für reguläre Workloads freigegeben. Die benötigten YAML-Dateien für die späteren Schritte liegen bereits in deinem Arbeitsverzeichnis bereit.

### 1. Vorhandene Dateien und Nodes anzeigen

Prüfe zunächst die vorbereiteten YAML-Dateien und lass dir alle Nodes inklusive ihrer aktuellen Labels anzeigen:

```bash
ls -l *.yaml
kubectl get nodes --show-labels
```{{exec}}

### 2. Standort-Labels vergeben

Vergib nun das Label `location=room-green` für `controlplane` und `location=room-blue` für `node01`:

```bash
kubectl label nodes controlplane location=room-green
kubectl label nodes node01 location=room-blue
```{{exec}}

### 3. Labels kontrollieren

Mit der Option `-L location` blendest du das neue Label als eigene Spalte in der Node-Übersicht ein:

```bash
kubectl get nodes -L location
```{{exec}}

Klicke anschließend unten rechts auf **Check**, um zum nächsten Schritt zu gelangen.
