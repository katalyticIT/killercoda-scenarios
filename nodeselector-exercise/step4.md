## Schritt 4: Pod für nicht vorhandenen Node (`room-red`) starten

`nodeSelector` ist eine **harte Scheduling-Bedingung** (*Hard Requirement*). Was passiert, wenn kein Node im Cluster das geforderte Label besitzt?

### 1. Manifest prüfen

In `pod-red.yaml` ist `location: room-red` eingetragen – ein Label, das keiner unserer Nodes trägt. Prüfe die Datei kurz mit `less` (beenden mit **`q`**):

```bash
less pod-red.yaml
```{{exec}}

### 2. Pod starten

Wende das Manifest an:

```bash
kubectl apply -f pod-red.yaml
```{{exec}}

### 3. Pod-Status und Events untersuchen

`pod-red` bleibt im Status **`Pending`** und erhält in der Spalte `NODE` keinen Eintrag (`<none>`). Im Abschnitt **`Events`** von `kubectl describe` dokumentiert der `default-scheduler`, dass kein Node zum `nodeSelector` passt (`FailedScheduling`):

```bash
kubectl get pods -o wide
kubectl describe pod pod-red
```{{exec}}
