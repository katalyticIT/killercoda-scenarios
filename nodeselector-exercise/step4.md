## Schritt 4: Pod für nicht vorhandenen Node (`room-red`) starten

`nodeSelector` ist eine **harte Scheduling-Bedingung** (*Hard Requirement*). Was passiert, wenn kein Node im Cluster das geforderte Label besitzt?

### 1. Manifest prüfen und `pod-red` starten

In `pod-red.yaml` ist `location: room-red` eingetragen – ein Label, das keiner unserer Nodes trägt. Starte den Pod:

```bash
cat pod-red.yaml
kubectl apply -f pod-red.yaml
```{{exec}}

### 2. Pod-Status prüfen

Beobachte den Status in der Pod-Übersicht. `pod-red` bleibt im Status **`Pending`** und erhält in der Spalte `NODE` keinen Eintrag (`<none>`):

```bash
kubectl get pods -o wide
```{{exec}}

### 3. Ursache in den Events untersuchen

Lass dir die Details des Pods anzeigen und lies ganz unten den Abschnitt **`Events`**. Dort dokumentiert der `default-scheduler`, dass kein Node zum `nodeSelector` passt (`FailedScheduling`):

```bash
kubectl describe pod pod-red
```{{exec}}
