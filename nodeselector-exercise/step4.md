## Schritt 4: Pod für nicht vorhandenen Node (`room-red`) starten

`nodeSelector` ist eine **harte Scheduling-Bedingung** (*Hard Requirement*). Was passiert, wenn kein Node im Cluster das geforderte Label besitzt?

### 1. Manifest prüfen

In `pod-red.yaml` ist `location: room-red` eingetragen – ein Label, das keiner unserer Nodes trägt. Prüfe die Datei kurz mit `cat`:

```bash
cat pod-red.yaml
```{{exec}}

### 2. Pod starten

Wende das Manifest an:

```bash
kubectl apply -f pod-red.yaml
```{{exec}}

### 3. Alle Pods überprüfen

Lass dir alle Pods anzeigen. `pod-red` bleibt im Status **`Pending`** und erhält in der Spalte `NODE` keinen Eintrag (`<none>`):

```bash
kubectl get pods -o wide
```{{exec}}

### 4. Details zum roten Pod prüfen

Untersuche nun die Details des Pods. Ganz unten im Abschnitt **`Events`** dokumentiert der `default-scheduler`, dass kein Node zum `nodeSelector` passt (`FailedScheduling`):

```bash
kubectl describe pod pod-red
```{{exec}}
