# Pod-Scheduling mit `nodeSelector`

Willkommen zu dieser praktischen Übung! Standardmäßig entscheidet der **kube-scheduler** automatisch, auf welchem verfügbaren Node ein neuer Pod gestartet wird. In vielen Szenarien – etwa bei spezieller Hardware, Compliance-Vorgaben oder physischen Standorten – soll ein Pod jedoch gezielt auf bestimmten Nodes laufen.

## Lernziele

In diesem Szenario wirst du:
1. Die vorhandenen Cluster-Nodes mit eigenen **Labels** (`location=room-green` und `location=room-blue`) klassifizieren.
2. Pods mithilfe von **`spec.nodeSelector`** gezielt auf diesen Nodes platzieren und deren Node-Zuweisung sowie Logs prüfen.
3. Beobachten, wie Kubernetes reagiert, wenn kein Node die geforderten Label-Kriterien erfüllt.
4. Die erstellten Ressourcen sauber wieder entfernen.

Klicke auf **START**, um die Übung zu beginnen.
