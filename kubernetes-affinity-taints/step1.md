## Schritt 1: Nodes mit Labels und einem Taint versehen

Die vorbereiteten YAML-Dateien für die folgenden Schritte liegen bereits in deinem Arbeitsverzeichnis bereit.

### 1. Vorhandene Dateien prüfen und Standort-Labels setzen

Prüfe die Dateien im Verzeichnis und vergib wie in der ersten Übung die Labels `location=room-green` für `controlplane` und `location=room-blue` für `node01`:

```bash
ls -l *.yaml
kubectl label nodes controlplane location=room-green
kubectl label nodes node01 location=room-blue
```{{exec}}

### 2. Node `node01` mit einem Taint absichern

Belege nun `node01` mit dem Taint `access=restricted:NoSchedule`, damit dort ohne ausdrückliche Ausnahmegenehmigung (*Toleration*) keine Pods eingeplant werden:

```bash
kubectl taint nodes node01 access=restricted:NoSchedule
```{{exec}}

### 3. Labels und Taint kontrollieren

Überprüfe die gesetzten Labels sowie den Taint auf `node01`:

```bash
kubectl get nodes -L location
kubectl describe node node01 | grep -A 3 Taints
```{{exec}}