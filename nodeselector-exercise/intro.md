# Pod-Scheduling mit `nodeSelector`

Willkommen zu dieser geführten Übung! Standardmäßig entscheidet der **kube-scheduler** automatisch, auf welchem verfügbaren Node ein neuer Pod gestartet wird. Soll ein Pod jedoch gezielt auf bestimmten Nodes laufen – etwa wegen spezieller Hardware, Compliance-Vorgaben oder physischer Standorte –, lässt sich dies über **Node-Labels** und **`nodeSelector`** steuern.

## Ablauf der Übung

1. **Nodes labeln:** Du versiehst die beiden Cluster-Nodes mit den Labels `location=room-green` und `location=room-blue`.
2. **Pod auf `room-green` starten:** Du wendest das vorbereitete Manifest `pod-green.yaml` an und prüfst Node-Zuweisung sowie Logs.
3. **Pod auf `room-blue` starten:** Du startest `pod-blue.yaml` und überprüfst Platzierung und Log-Ausgabe.
4. **Fehlenden Ziel-Node testen:** Du startest `pod-red.yaml` (`location=room-red`) und analysierst, warum der Pod im Status `Pending` bleibt.
5. **Aufräumen:** Du löschst alle erstellten Pods wieder.

Klicke auf **START**, um die Umgebung zu starten.
